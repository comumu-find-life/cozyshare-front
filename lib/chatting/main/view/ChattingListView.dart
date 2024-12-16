import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_and_job/chatting/main/controller/ChattingController.dart';
import 'package:home_and_job/chatting/main/widgets/ChatItemWidget.dart';
import 'package:home_and_job/chatting/main/widgets/EmpyyChatWidget.dart';
import 'package:home_and_job/constants/Colors.dart';
import 'package:home_and_job/constants/Fonts.dart';

class ChattingListView extends StatelessWidget {
  ChattingController _controller = ChattingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteBackGroundColor,
      appBar: _buildAppBar(),
      body: SingleChildScrollView(
          child: FutureBuilder(
        future: _controller.loadAllDmList(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {

            return Container();
          } else {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: SizedBox(
                    height: 30.h,
                  ),
                ),
                _controller.chatItems.length == 0
                    ? EmptyChatWidget()
                    : Column(
                        children: _controller.chatItems.map((chatItem) {
                          return ChatItemWidget(chatItem, _controller.myUserId);
                        }).toList(),
                      ),
              ],
            );
          }
        },
      )),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: kWhiteBackGroundColor,
      toolbarHeight: 50.h,
      automaticallyImplyLeading: false,
      elevation: 0,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
              margin: EdgeInsets.only(top: 15.h, left: 5.w),
              child: FBoldText("Chats", kTextBlackColor, 15))
        ],
      ),
    );
  }
}
