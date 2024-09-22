
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:home_and_job/chatting/chat-common/widgets/ChatDateLine.dart';
import 'package:home_and_job/chatting/chat-detail-getter/controller/ChatGetterDetailController.dart';
import 'package:home_and_job/model/chat/response/DirectMessageDto.dart';

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
  final ScrollController _scrollController = ScrollController(); // ScrollController 추가

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
          // 채팅 화면이 로드된 후에 스크롤을 맨 아래로 이동
          WidgetsBinding.instance.addPostFrameCallback((_) {
            _scrollToBottom();  // 스크롤을 맨 아래로 이동
          });

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

  // 메시지 리스트 표시
  Widget _buildConversation() {
    return Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        color: kWhiteBackGroundColor,
        child: Obx(() {
          return ListView.builder(
            controller: _scrollController, // ScrollController 추가
            reverse: false,
            itemCount: _controller.messages.length,
            itemBuilder: (context, int index) {
              final message = _controller.messages[index];
              final previousMessage = index > 0 ? _controller.messages[index - 1] : null;

              // 날짜가 바뀌었는지 확인
              bool isNewDate = false;
              if (previousMessage == null || message.formatDate() != previousMessage.formatDate()) {
                isNewDate = true;
              }

              return Column(
                children: [
                  if (isNewDate) ChatDateLine(message.formatDate()), // 날짜 헤더 표시
                  GetterMessageWidget(message, _controller),
                ],
              );
            },
          );
        }),
      ),
    );
  }

  // 메시지 리스트를 맨 아래로 스크롤
  void _scrollToBottom() {
    if (_scrollController.hasClients) {
      _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
    }
  }
}
