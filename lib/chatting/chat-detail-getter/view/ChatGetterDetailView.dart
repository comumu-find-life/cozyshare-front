
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:home_and_job/chatting/chat-detail-getter/controller/ChatGetterDetailController.dart';

import '../../../constants/Colors.dart';
import '../../chat-common/widgets/ChatAppBar.dart';
import '../widgets/GetterHomePostInformationWidget.dart';
import '../widgets/GetterInputMessageWidget.dart';
import '../widgets/GetterMessageWidget.dart';

class ChatGetterDetailView extends StatefulWidget {
  final int receiverId;
  final int roomId;
  final int homeId;


  const ChatGetterDetailView({
    Key? key,
    required this.receiverId,
    required this.roomId,
    required this.homeId
  }) : super(key: key);

  @override
  State<ChatGetterDetailView> createState() => _ChatGetterDetailViewState();
}

class _ChatGetterDetailViewState extends State<ChatGetterDetailView> {
  final ChatGetterDetailController _controller = Get.put(ChatGetterDetailController());

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
            appBar: ChatAppBar(context, _controller.receiver.nickname, _controller.receiver.id),
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
                        GetterInputMessageWidget(_controller),
                      ],
                    ),
                  ),
                ),
                GetterHomePostInformationWidget(_controller),
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
              return GetterMessageWidget(message, _controller);
            },
          );
        }),
      ),
    );
  }
}
