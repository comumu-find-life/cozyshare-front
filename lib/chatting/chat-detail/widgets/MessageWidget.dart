import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:home_and_job/chatting/chat-detail/deal-message-widget/DealFinishWidget.dart';
import 'package:home_and_job/chatting/chat-detail/deal-message-widget/DealStartMessageWidget.dart';
import 'package:home_and_job/constants/Colors.dart';
import 'package:home_and_job/constants/Fonts.dart';
import '../../../model/chat/request/DirectMessageDto.dart';
import '../controller/ChatDetailController.dart';
import '../mode/User.dart';
import '../mode/message_model.dart';
import '../deal-message-widget/DealDuringMessageWidget.dart';

/**
 * 채팅 내용 뿌려주는 위젯
 */
class MessageWidget extends StatelessWidget {
  final DirectMessageDto message;
  final ChatDetailController controller;

  MessageWidget(this.message, this.controller);

  @override
  Widget build(BuildContext context) {
    bool isMe = message.senderId == controller.currentUser.id;
    int isDeal = 0;

    return Container(
      margin: EdgeInsets.only(top: 10),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
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
                text: message.message,
                isDeal: isDeal,
                controller: controller,
              ),
            ],
          ),
          MessageTime(isMe: isMe, time: "12:00"),
        ],
      ),
    );
  }
}

/**
 * 메시지 위젯
 */
class MessageBubble extends StatelessWidget {
  final ChatDetailController controller;
  final bool isMe;
  final int isDeal;
  final String? text;

  MessageBubble({
    required this.controller,
    required this.isMe,
    required this.text,
    required this.isDeal,
  });

  @override
  Widget build(BuildContext context) {
    return isDeal != 0
        ? _buildDealMessage()
        : _buildTextMessage(context);
  }

  Widget _buildDealMessage() {
    switch (isDeal) {
      case 1:
        return DealStartMessageWidget(controller);
      case 2:
        return DealDuringMessageWidget(controller);
      case 3:
        return DealFinishWidget();
      default:
        return SizedBox.shrink();
    }
  }

  Widget _buildTextMessage(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      constraints: BoxConstraints(
        maxWidth: MediaQuery.of(context).size.width * 0.6,
      ),
      decoration: BoxDecoration(
        color: isMe ? kDarkBlue : kLightBlue,
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

class MessageTime extends StatelessWidget {
  final bool isMe;
  final String time;

  MessageTime({
    required this.isMe,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5),
      child: Row(
        mainAxisAlignment: isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          if (!isMe) SizedBox(width: 40.w),
          HintText2("24.02.14", kGrey500Color),
        ],
      ),
    );
  }
}
