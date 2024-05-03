import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:home_and_job/chatting/chat-detail/deal-message-widget/DealFinishWidget.dart';
import 'package:home_and_job/chatting/chat-detail/deal-message-widget/DealStartMessageWidget.dart';
import 'package:home_and_job/constants/Colors.dart';
import 'package:home_and_job/constants/Fonts.dart';
import '../controller/ChatDetailController.dart';
import '../mode/User.dart';
import '../mode/message_model.dart';
import '../deal-message-widget/DealDuringMessageWidget.dart';


/**
 * 채팅 내용 뿌려주는 위젯
 */
class Conversation extends StatelessWidget {
  final User user;
  final ChatDetailController _controller;

  Conversation(this.user, this._controller);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      reverse: false,
      itemCount: messages.length,
      itemBuilder: (context, int index) {
        final message = messages[index];
        return MessageWidget(message);
      },
    );
  }
}


class MessageWidget extends StatelessWidget {
  final Message message;

  MessageWidget(this.message);

  @override
  Widget build(BuildContext context) {
    bool isMe = message.sender?.id == currentUser.id;
    int isDeal = message.isDeal;

    return Container(
      margin: EdgeInsets.only(top: 10),
      child: Column(
        children: [
          Row(
            mainAxisAlignment:
                isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              if (!isMe)
                CircleAvatar(
                  radius: 15,
                  backgroundImage: AssetImage("assets/images/test/man.png"),
                ),
              SizedBox(width: 10),
              MessageBubble(
                isMe: isMe,
                text: message.text,
                isDeal: isDeal,
              ),
            ],
          ),
          MessageTime(isMe: isMe),
        ],
      ),
    );
  }
}

class MessageBubble extends StatelessWidget {
  final bool isMe;
  final int isDeal;
  final String? text;

  MessageBubble({required this.isMe, required this.text, required this.isDeal});

  @override
  Widget build(BuildContext context) {
    // DealStartMessageWidget() 안전 거래 시작 위젯
    // DealDuringMessageWidget() 안전 거래 진행중 위젯
    return isDeal != 0
        ? FilterDealMessage(isDeal)
        : Container(
            padding: EdgeInsets.all(10),
            constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width * 0.6),
            decoration: BoxDecoration(
              color: isMe ? Color(0xffFCAAAB) : Colors.grey[200],
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
                bottomLeft: Radius.circular(isMe ? 12 : 0),
                bottomRight: Radius.circular(isMe ? 0 : 12),
              ),
            ),
            child: Text(
              text ?? "",
              style: TextStyle(
                fontSize: 13,
                letterSpacing: 1.5,
                fontWeight: FontWeight.w600,
                color: isMe ? Colors.white : Colors.grey[800],
              ),
            ),
          );
  }
}

Widget FilterDealMessage(int isDeal){
  return isDeal == 1?DealStartMessageWidget():isDeal == 2?DealDuringMessageWidget(): DealFinishWidget();
}

class MessageTime extends StatelessWidget {
  final bool isMe;

  MessageTime({required this.isMe});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5),
      child: Row(
        mainAxisAlignment:
            isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          if (!isMe) SizedBox(width: 40),
          HintText2("24.02.14", kGrey200Color),
        ],
      ),
    );
  }
}
