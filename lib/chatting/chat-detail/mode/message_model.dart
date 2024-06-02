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