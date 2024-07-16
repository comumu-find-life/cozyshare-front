
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:home_and_job/chatting/chat-detail/controller/ChatDetailController.dart';
import 'package:home_and_job/chatting/chat-detail/widgets/ChatAppBar.dart';
import 'package:home_and_job/chatting/chat-detail/widgets/HomePostInformationWidget.dart';
import 'package:home_and_job/constants/Colors.dart';
import 'package:home_and_job/constants/Fonts.dart';
import '../widgets/InputMessageWidget.dart';
import '../widgets/MessageWidget.dart';

class ChatDetailView extends StatefulWidget {
  final int receiverId;
  final int roomId;
  final int homeId;

  const ChatDetailView({
    Key? key,
    required this.receiverId,
    required this.roomId,
    required this.homeId
  }) : super(key: key);

  @override
  State<ChatDetailView> createState() => _ChatDetailViewState();
}

class _ChatDetailViewState extends State<ChatDetailView> {
  final ChatDetailController _controller = Get.put(ChatDetailController());

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _controller.loadInit(widget.receiverId, widget.roomId, widget.homeId),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {

          return Container();
        } else {
          return Scaffold(
            appBar: ChatAppBar(context, _controller),
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
        
                        _buildConversation(),
                        InputMessageWidget(_controller),
                      ],
                    ),
                  ),
                ),
                HomePostInformationWidget(_controller),
              ],
            ),
          );
        }
      },
    );
  }

  Widget _buildConversation() {
    return Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        color: kWhiteBackGroundColor,
        child: Obx(() {
          // Debugging
          return ListView.builder(
            reverse: false,
            itemCount: _controller.messages.length,
            itemBuilder: (context, int index) {
              final message = _controller.messages[index];
              return MessageWidget(message, _controller);
            },
          );
        }),
      ),
    );
  }
}
