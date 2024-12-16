import 'dart:async';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:home_and_job/rest-api/chat-api/ChatApi.dart';
import 'package:home_and_job/rest-api/deal-api/ProtectedDealApi.dart';
import 'package:home_and_job/rest-api/user-api/ProfileDetailApi.dart';
import 'package:home_and_job/model/chat/request/DirectMessageRequest.dart';
import 'package:home_and_job/model/deal/enums/DealState.dart';
import 'package:home_and_job/model/deal/request/ProtectedDealFindRequest.dart';
import 'package:home_and_job/model/home/response/HomeInformationResponse.dart';
import 'package:home_and_job/model/user/response/UserProfileResponse.dart';
import 'package:home_and_job/rest-api/home-api/RoomApi.dart';
import 'package:home_and_job/utils/DiskDatabase.dart';
import 'package:stomp_dart_client/stomp_dart_client.dart';

import '../../../model/chat/response/DirectMessageDto.dart';
import '../../../model/deal/response/ProtectedDealResponse.dart';
import '../../../rest-api/user-api/UserPointApi.dart';

/**
 * (1) 대화 목록 불러오기
 * (2) 안전거래 시작하기 클릭 ==> provider 만 클릭
 * (3) 안전거래 폼 생성 (provider)
 * (4) getter 가 "입금하기" 버튼 클릭
 * (5) 가상계좌 입금 후 "입금 신청" 버튼 클릭
 * (6) 거래 진행중 폼 생성 (getter)
 * (7) getter 가 "거래 확정" 버튼 클릭
 *  - "거래 취소" 신청시 보증금은 getter 에게로 환불(?) - 아직 미정
 * (8) "거래 성사" 폼 생성
 */
class ChatProviderDetailController extends GetxController {
  static String WEB_SOCKET_URL = "ws://localhost:8082/dm/websocket";

  late bool _isExistAccount;
  late int _roomId;
  late int _providerId;
  late int _getterId;
  late Map<int, ProtectedDealResponse> dealMap = {};
  late HomeInformationResponse _home;
  late UserProfileResponse _sender;
  late UserProfileResponse _receiver;
  late UserProfileResponse _currentUser;
  TextEditingController textEditingController = TextEditingController();
  RxList<DirectMessageResponse> _messages = <DirectMessageResponse>[].obs;
  late StompClient stompClient;


  /**
   * 초기값 조회
   */
  Future<bool> loadInit(int receiverId, int roomId, int homeId) async {
    _roomId = roomId;
    await loadUsers(receiverId);
    await loadMessages();
    await loadHomeInformation(homeId);
    await loadProtectedDeal();
    await loadAccount();
    connectToStomp();
    return true;
  }

  /**
   * dealMap에서 key로 ProtectedDealByProviderResponse 조회
   */
  ProtectedDealResponse? getDealById(int dealId) {

    if (dealMap.containsKey(dealId)) {
      return dealMap[dealId];
    } else {
      return null;  // 해당 key가 없으면 null 반환
    }
  }

  loadAccount() async{
    _isExistAccount = await UserPointApi().isExistAccount();
  }

  /**
   * 안전거래 조회 메서드
   */
  Future<bool> loadProtectedDeal() async {
    var protectedDealFindRequest = ProtectedDealFindRequest(
        getterId: isProvider() ? _receiver.id : _sender.id,
        providerId: int.parse(_home.providerId!),
        homeId: _home.homeId!,
        dmId: _roomId);
    List<ProtectedDealResponse> response = await ProtectedDealApi().loadProtectedDeal(protectedDealFindRequest);
    // dealMap에 정보를 넣음
    if (response != null) {
      dealMap = { for (var deal in response) deal.id: deal };
    }
    return true;
  }

  // 진행중인 안전거래가 하나라도 있으면 false 를 반환해야한다.
  bool canAddDeal() {
    // dealMap 내 모든 거래 상태가 진행 중이 아닌 경우 true 반환
    for (var deal in dealMap.values) {
          if(deal.dealState.isInProgressState()) {
        return false; // 진행 중인 거래가 하나라도 있으면 false 반환
      }
    }
    return true; // 진행 중인 거래가 없으면 true 반환
  }



  int getGetterId() {
    if (_home.providerId == _sender.id) {
      return _receiver.id;
    }
    return _sender.id;
  }

  void connectToStomp() {
    stompClient = StompClient(
      config: StompConfig(
        url: "ws://localhost:8082/dm/websocket",
        onConnect: onStompConnected,
        onWebSocketError: (dynamic error) => print('WebSocket Error: $error'),
        onStompError: (dynamic error) => print('Stomp Error: $error'),
        onDisconnect: (frame) => print('Disconnected'),
      ),
    );
    stompClient.activate();
  }

  void onStompConnected(StompFrame frame) {
    stompClient.subscribe(
      destination: '/sub/chat/room/${_roomId}', // 채팅방 구독
      callback: (frame) {
        Map<String, dynamic> jsonData = jsonDecode(frame.body!);
        DirectMessageResponse message =
            DirectMessageResponse.fromJson(jsonData);
        _messages.add(message!);
      },
    );
  }

  Future<bool> loadHomeInformation(int homeId) async {
    _home = (await RoomApi().loadRoomById(homeId))!;
    _providerId = isProvider() ? _currentUser.id : _receiver.id;
    _getterId = isProvider() ? _receiver.id : _currentUser.id;

    return true;
  }

  Future<bool> loadMessages() async {
    List<DirectMessageResponse> initMessages =
        await DmApi().loadDmHistory(_sender.id, _receiver.id);
    _messages.value = initMessages;
    return true;
  }

  Future<bool> loadUsers(int receiverId) async {
    String? senderId = await DiskDatabase().getUserId();
    _sender = (await ProfileDetailApi().loadUserProfile(int.parse(senderId!)))!;
    _receiver = (await ProfileDetailApi().loadUserProfile(receiverId))!;
    _currentUser = _sender;
    return true;
  }

  void sendMessage() {
    var directMessageDto = DirectMessageRequest(
      senderId: _sender.id,
      receiverId: _receiver.id,
      message: textEditingController.text,
      roomId: _roomId.toString(),
      isDeal: 0,
      dealState: DealState.NONE.name, dealId: null,
    );
    textEditingController.clear();
    stompClient.send(
      destination: '/pub/chat/message',
      body: jsonEncode(directMessageDto.toJson()),
    );
  }

  void startProtectedDeal(int dealId) async {
    await loadProtectedDeal();
    var directMessageRequest = DirectMessageRequest(
      receiverId: _getterId,
      message: "Deposit Request",
      roomId: _roomId.toString(),
      isDeal: 1,
      dealState: DealState.REQUEST_DEAL.name,
      senderId: _providerId, dealId: dealId,
    );

    stompClient.send(
      destination: '/pub/chat/message',
      body: jsonEncode(directMessageRequest.toJson()),
    );
  }

  bool isProvider() {
    return _currentUser.id.toString() == _home.providerId.toString();
  }

  @override
  void onClose() {
    stompClient.deactivate();
    super.onClose();
  }

  HomeInformationResponse get home => _home;

  UserProfileResponse get getter => _sender;

  UserProfileResponse get provider => _receiver;

  UserProfileResponse get currentUser => _currentUser;

  List<DirectMessageResponse> get messages => _messages.value;

  UserProfileResponse get receiver => _receiver;

  UserProfileResponse get sender => _sender;

  int get providerId => _providerId;

  int get roomId => _roomId;

  int get getterId => _getterId;

  bool get isExistAccount => _isExistAccount;
}
