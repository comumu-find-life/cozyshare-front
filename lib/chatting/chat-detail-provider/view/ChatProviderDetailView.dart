
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:home_and_job/constants/Colors.dart';
import 'package:home_and_job/constants/Fonts.dart';
import 'package:home_and_job/model/chat/response/DirectMessageDto.dart';
import '../../chat-common/widgets/ChatDateLine.dart';
import '../../chat-detail-getter/widgets/GetterMessageWidget.dart';
import '../controller/ChatProviderDetailController.dart';
import '../../chat-common/widgets/ChatAppBar.dart';
import '../widgets/ProviderHomePostInformationWidget.dart';
import '../widgets/ProviderInputMessageWidget.dart';
import '../widgets/ProviderMessageWidget.dart';

class ChatProviderDetailView extends StatefulWidget {
  final int receiverId;
  final int roomId;
  final int homeId;

  const ChatProviderDetailView({
    Key? key,
    required this.receiverId,
    required this.roomId,
    required this.homeId
  }) : super(key: key);

  @override
  State<ChatProviderDetailView> createState() => _ChatProviderDetailViewState();
}

class _ChatProviderDetailViewState extends State<ChatProviderDetailView> {
  final ChatProviderDetailController _controller = Get.put(ChatProviderDetailController());
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
                        ProviderInputMessageWidget(_controller),
                      ],
                    ),
                  ),
                ),
                ProviderHomePostInformationWidget(_controller),

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
                  ProviderMessageWidget(message, _controller),
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
