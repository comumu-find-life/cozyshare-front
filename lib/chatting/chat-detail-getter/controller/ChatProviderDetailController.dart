
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:home_and_job/model/deal/response/ProtectedDealByProviderResponse.dart';
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
import '../../../model/deal/response/ProtectedDealByGetterResponse.dart';


class ChatGetterDetailController extends GetxController {
  late int _roomId;
  late int _providerId;
  late int _getterId;
  late ProtectedDealByGetterResponse? _dealResponse;
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
    connectToStomp();
    return true;
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
    _dealResponse = await ProtectedDealApi().loadProtectedDealByGetter(protectedDealFindRequest);
    return true;
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
        url: 'ws://10.0.2.2:8082/dm/websocket',
        // WebSocket 서버 엔드포인트
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
      dealState: DealState.NONE.name,
    );
    textEditingController.clear();
    stompClient.send(
      destination: '/pub/chat/message',
      body: jsonEncode(directMessageDto.toJson()),
    );
  }



  // 입금 신청 메서드 (only getter)
  void applyDeposit() async{
    var directMessageRequest = DirectMessageRequest(
      receiverId: _providerId,
      //getter Id
      message: "DEAL MESSAGE",
      // provider id
      roomId: _roomId.toString(),

      isDeal: 2,
      dealState: DealState.REQUEST_DEPOSIT.name,
      senderId: _getterId,
    );

    stompClient.send(
      destination: '/pub/chat/message',
      body: jsonEncode(directMessageRequest.toJson()),
    );

    await loadProtectedDeal();

  }

  // 거래 확정 요청 메서드
  void confirmDeal() async{
    // var directMessageRequest = DirectMessageRequest(
    //   receiverId: _providerId,
    //   //getter Id
    //   message: "DEAL MESSAGE",
    //   // provider id
    //   roomId: _roomId.toString(),
    //
    //   isDeal: 3,
    //   dealState: DealState.COMPLETE_DEAL.name,
    //   senderId: _getterId,
    // );
    // stompClient.send(
    //   destination: '/pub/chat/message',
    //   body: jsonEncode(directMessageRequest.toJson()),
    // );
    await loadProtectedDeal();
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


  ProtectedDealByGetterResponse? get dealResponse => _dealResponse;

  int get roomId => _roomId;

  int get getterId => _getterId;
}