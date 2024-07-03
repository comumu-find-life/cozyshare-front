import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:home_and_job/chatting/chat-detail/controller/ChatDetailController.dart';
import 'package:home_and_job/chatting/chat-detail/widgets/ChatAppBar.dart';
import 'package:home_and_job/chatting/chat-detail/widgets/HomePostInformationWidget.dart';
import 'package:home_and_job/constants/Colors.dart';

import '../widgets/InputMessageWidget.dart';
import '../widgets/MessageWidget.dart';

class ChatDetailView extends StatefulWidget {
  int receiverId;
  int homeId;

  ChatDetailView(this.receiverId, this.homeId);

  @override
  State<ChatDetailView> createState() => _ChatDetailViewState();
}

class _ChatDetailViewState extends State<ChatDetailView> {
  ChatDetailController _controller = ChatDetailController();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _controller.loadInit(widget.receiverId, widget.homeId),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasError) {
          return Container();
        } else {
          return Scaffold(
              appBar: ChatAppBar(
                  context, _controller, true),
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
                        children: [_buildConversation(), InputMessageWidget(_controller)],
                      ),
                    ),
                  ),
                  HomePostInformationWidget()
                ],
              ));
        }
      },
    );
  }

  Widget _buildConversation() {
    return Expanded(
      child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          color: kWhiteBackGroundColor,
          child: Obx(() => ListView.builder(
                reverse: false,
                itemCount: _controller.messages.length,
                itemBuilder: (context, int index) {
                  final message = _controller.messages[index];
                  return MessageWidget(message, _controller);
                },
              ))),
    );
  }
}
