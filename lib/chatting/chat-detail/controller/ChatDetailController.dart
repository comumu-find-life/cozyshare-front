import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:home_and_job/chatting/api/ChatApi.dart';
import 'package:home_and_job/chatting/chat-detail/mode/User.dart';
import 'package:home_and_job/detail-profile/api/ProfileDetailApi.dart';
import 'package:home_and_job/model/chat/request/DirectMessageRequest.dart';
import 'package:home_and_job/model/deal/enums/DealState.dart';
import 'package:home_and_job/model/home/response/HomeInformationResponse.dart';
import 'package:home_and_job/model/user/response/UserProfileResponse.dart';
import 'package:home_and_job/protected-deal/deal-generator/view/DealGeneratorViewByProvider.dart';
import 'package:home_and_job/room/api/RoomApi.dart';
import 'package:home_and_job/utils/DiskDatabase.dart';
import 'package:stomp_dart_client/stomp_dart_client.dart';

import '../../../model/chat/response/DirectMessageDto.dart';
import '../mode/message_model.dart';

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
class ChatDetailController extends GetxController {
  late int _roomId;
  late HomeInformationResponse _home;
  late UserProfileResponse _sender;
  late UserProfileResponse _receiver;
  late UserProfileResponse _currentUser;
  TextEditingController textEditingController = TextEditingController();
  RxList<DirectMessageResponse> _messages = <DirectMessageResponse>[].obs;
  late StompClient stompClient;

  Future<bool> loadInit(int receiverId, int roomId, int homeId) async {
    _roomId = roomId;
    await loadUsers(receiverId);
    await loadMessages();
    await loadHomeInformation(homeId);
    connectToStomp();
    return true;
  }


  void connectToStomp() {
    print("Connecting to Stomp...");
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
        DirectMessageResponse message = DirectMessageResponse.fromJson(jsonData);
        _messages.add(message!);
      },
    );
  }

  Future<bool> loadHomeInformation(int homeId) async {
    _home = (await RoomApi().findById(homeId))!;
    return true;
  }

  Future<bool> loadMessages() async {
    List<DirectMessageResponse> initMessages =
        await ChatApi().loadDmMessages(_sender.id, _receiver.id);
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
      roomId: _roomId.toString(), isDeal: false, dealState: DealState.NONE.name,
    );
    textEditingController.clear();
    stompClient.send(
      destination: '/pub/chat/message',
      body: jsonEncode(directMessageDto.toJson()),
    );
  }

  // 안전거래 시작 메서드 (only provider)
  void startProtectedDeal() {
    Get.to(() => DealGeneratorViewByProvider(this));
    // var message = Message(isDeal: 1,
    // sender: _receiver,
    // time: "12:09 AM",
    //   avatar: _receiver.avatar,
    //   text: ""
    // );
    //
    // _messages.add(message);
  }

  // 입금 신청 메서드 (only getter)
  void applyDeposit() {
    // var message = Message(isDeal: 2,
    //     sender: _sender,
    //     time: "12:09 AM",
    //     avatar: _sender.avatar,
    //     text: ""
    // );
    // _messages.add(message);
  }

  // 거래 확정 메서드
  void confirmDeal() {
    // var message = Message(isDeal: 3,
    //     sender: _sender,
    //     time: "12:09 AM",
    //     avatar: _sender.avatar,
    //     text: ""
    // );
    // _messages.add(message);
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

  int get roomId => _roomId;
}
