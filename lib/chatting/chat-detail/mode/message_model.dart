import 'User.dart';

class Message {
  final User? sender;
  final String? avatar;
  final String? time;
  final int? unreadCount;
  final bool? isRead;
  final String? text;
  final int isDeal; // 0== 거래 채팅이 아님, 1 == 거래 시작, 2 == 거래 중, 3 == 거래 완료

  Message(
      {this.sender,
      this.avatar,
      this.time,
      this.unreadCount,
      this.text,
      this.isRead,
      required this.isDeal});
}

final List<Message> messages = [

  Message(
    sender: addison,
    // 보낸 사람
    time: '12:09 AM',
    avatar: addison.avatar,
    text: "집 있나요?",
    isDeal: 0,
  ),
  Message(
    sender: currentUser,
    // 보낸 사람
    time: '12:09 AM',
    avatar: addison.avatar,
    text: "네 있어요",
    isDeal: 0,
  ),
  Message(
    sender: addison,
    // 보낸 사람
    time: '12:09 AM',
    avatar: addison.avatar,
    text: "안전 거래 가능한가요?",
    isDeal: 0,
  ),

  Message(
    sender: currentUser,
    // 보낸 사람
    time: '12:09 AM',
    avatar: addison.avatar,
    text: "네 가능해요",
    isDeal: 0,
  ),
  Message(
    sender: currentUser,
    // 보낸 사람
    time: '12:09 AM',
    avatar: addison.avatar,
    text: "",
    isDeal: 1,
  ),
  Message(
    sender: addison,
    // 보낸 사람
    time: '12:09 AM',
    avatar: addison.avatar,
    text: "",
    isDeal: 2,
  ),
  Message(
    sender: addison,
    // 보낸 사람
    time: '12:09 AM',
    avatar: addison.avatar,
    text: "",
    isDeal: 3,
  ),
];
