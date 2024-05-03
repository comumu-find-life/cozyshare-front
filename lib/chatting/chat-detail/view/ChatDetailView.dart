import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_and_job/chatting/chat-detail/controller/ChatDetailController.dart';
import 'package:home_and_job/chatting/chat-detail/mode/User.dart';
import 'package:home_and_job/chatting/chat-detail/widgets/ChatAppBar.dart';
import 'package:home_and_job/chatting/chat-detail/widgets/HomePostInformationWidget.dart';
import 'package:home_and_job/constants/Colors.dart';

import '../widgets/InputMessageWidget.dart';
import '../widgets/Conversation.dart';

class ChatDetailView extends StatefulWidget {
  //currentUser
  final User user;

  @override
  State<ChatDetailView> createState() => _ChatDetailViewState();

  ChatDetailView(this.user);
}

class _ChatDetailViewState extends State<ChatDetailView> {
  ChatDetailController _controller = ChatDetailController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: ChatAppBar(context, _controller.isProvider),
        backgroundColor: kBlueColor,
        body: Stack(
          children: [
            Container(
              margin: EdgeInsets.only(top: 70.h),
              child: GestureDetector(
                onTap: () {
                  FocusScope.of(context).unfocus();
                },
                child: Column(
                  children: [
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        color: kWhiteBackGroundColor,
                        child: ClipRRect(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30),
                          ),
                          child: Conversation(widget.user, _controller),
                        ),
                      ),
                    ),
                    InputMessageWidget()
                  ],
                ),
              ),
            ),
            HomePostInformationWidget()
          ],
        ));
  }



}
