

import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:home_and_job/chatting/api/ChatApi.dart';
import 'package:home_and_job/chatting/chat-detail/mode/User.dart';

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
class ChatDetailController extends GetxController{
  //Rx<bool> _isProvider = true.obs;
  User _getter = User(id: 1, name: 'YoungSol', avatar: 'assets/images/test/user.png', isProvider: false);
  User _provider = User(id: 2, name: 'Minseok', avatar: 'assets/images/test/user.png', isProvider: true);
  late User _currentUser;

  RxList _chatList = [].obs;
  RxList _messages = [].obs;

  Future<bool> loadMessages(int roomId) async {
    _chatList.value = await ChatApi().loadDmInformation(roomId);

    return true;
  }

  void sendMessage(){

  }

  // 안전거래 시작 메서드 (only provider)
  void startProtectedDeal(){
    var message = Message(isDeal: 1,
    sender: _provider,
    time: "12:09 AM",
      avatar: _provider.avatar,
      text: ""
    );

    _messages.add(message);
  }

  // 입금 신청 메서드 (only getter)
  void applyDeposit(){
    var message = Message(isDeal: 2,
        sender: _getter,
        time: "12:09 AM",
        avatar: _getter.avatar,
        text: ""
    );
    _messages.add(message);
  }

  // 거래 확정 메서드
  void confirmDeal() {
    var message = Message(isDeal: 3,
        sender: _getter,
        time: "12:09 AM",
        avatar: _getter.avatar,
        text: ""
    );
    _messages.add(message);
  }

  void loadInit(){
    _currentUser = _provider;

    _messages.value = [
      Message(
        sender: _getter,
        // 보낸 사람
        time: '12:09 AM',
        avatar: _getter.avatar,
        text: "집 있나요?",
        isDeal: 0,
      ),
      Message(
        sender: _provider,
        // 보낸 사람
        time: '12:09 AM',
        avatar: _provider.avatar,
        text: "네 있어요",
        isDeal: 0,
      ),
      Message(
        sender: _getter,
        // 보낸 사람
        time: '12:09 AM',
        avatar: _getter.avatar,
        text: "안전 거래 가능한가요?",
        isDeal: 0,
      ),

      Message(
        sender: _provider,
        // 보낸 사람
        time: '12:09 AM',
        avatar: _provider.avatar,
        text: "네 가능해요",
        isDeal: 0,
      ),
    ];
  }


  User get getter => _getter;

  User get provider => _provider;

  User get currentUser => _currentUser;

  List get messages => _messages.value;
}