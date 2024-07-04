import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:home_and_job/chatting/api/ChatApi.dart';
import 'package:home_and_job/chatting/chat-detail/mode/User.dart';
import 'package:home_and_job/detail-profile/api/ProfileDetailApi.dart';
import 'package:home_and_job/model/user/response/UserProfileResponse.dart';
import 'package:home_and_job/utils/DiskDatabase.dart';
import 'package:stomp_dart_client/stomp_dart_client.dart';

import '../../../model/chat/request/DirectMessageDto.dart';
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
  late int _homeId;
  late UserProfileResponse _sender;
  late UserProfileResponse _receiver;
  late UserProfileResponse _currentUser;
  TextEditingController textEditingController = TextEditingController();
  RxList<DirectMessageDto> _messages = <DirectMessageDto>[].obs;
  late StompClient stompClient;

  Future<bool> loadInit(int receiverId, int homeId) async {
    await loadMessages();
    await loadUsers(receiverId);
    _homeId = homeId;
    connectToStomp();
    return true;
  }

  void connectToStomp() {
    stompClient = StompClient(
      config: StompConfig(
        url: 'ws://10.0.2.2:8082/dm/websocket', // WebSocket 서버 엔드포인트
        onConnect: onStompConnected,
        onWebSocketError: (dynamic error) => print('WebSocket Error: $error'),
      ),
    );

    stompClient.activate();
  }

  void onStompConnected(StompFrame frame) {
    stompClient.subscribe(
      destination: '/sub/chat/room/1', // 채팅방 구독
      callback: (frame) {
        print("DDDDD");

        Map<String, dynamic> jsonData = jsonDecode(frame.body!);

        // Use the fromJson factory to creat
        // e an instance of DirectMessageDto
        DirectMessageDto message = DirectMessageDto.fromJson(jsonData);
        print(message.message);
        _messages.add(message!);
      },
    );
  }

  Future<bool> loadMessages() async {
    //ProfileDetailApi().loadUserProfile(userIdx);
    //_chatList.value = await ChatApi().loadDmInformation(roomId);
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
    // stompClient.send(
    //   destination: '/pub/chat/message',
    //   body: json.encode({
    //     'senderId': 1,
    //     'senderName': 'User1',
    //     'roomId': '1',
    //     'receiverId': 2,
    //     'message': textEditingController.text,
    //   }),
    //
    // );
    var directMessageDto = DirectMessageDto(
        senderId: _sender.id,
        receiverId: _receiver.id,
        message: textEditingController.text,
        roomId: _homeId.toString(),
        senderName: _sender.nickname);
    textEditingController.clear();

    stompClient.send(
      destination: '/pub/chat/message',
      body: jsonEncode(directMessageDto.toJson()),
    );
  }

  // 안전거래 시작 메서드 (only provider)
  void startProtectedDeal() {
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

  UserProfileResponse get getter => _sender;

  UserProfileResponse get provider => _receiver;

  UserProfileResponse get currentUser => _currentUser;

  List<DirectMessageDto> get messages => _messages.value;
}
