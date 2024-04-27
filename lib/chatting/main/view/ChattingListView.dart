import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_and_job/chatting/main/controller/ChattingController.dart';
import 'package:home_and_job/chatting/main/widgets/ChatItemWidget.dart';
import 'package:home_and_job/common-widgets/app-bar/CommonAppbar.dart';
import 'package:home_and_job/constants/Colors.dart';
import 'package:home_and_job/constants/Fonts.dart';

class ChattingListView extends StatelessWidget {
  const ChattingListView({super.key});

  @override
  Widget build(BuildContext context) {
    ChattingController _controller = ChattingController();

    return Scaffold(
      appBar: _buildAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ChatItemWidget(),
            ChatItemWidget(),
            ChatItemWidget(),
            ChatItemWidget(),

          ],
        ),
      ),
    );
  }
  AppBar _buildAppBar(){
    return AppBar(
      backgroundColor: kWhiteBackGroundColor,
      toolbarHeight: 50.h,
      automaticallyImplyLeading: false,
      elevation: 0,
      title: Row(
        children: [
          Container(
            margin: EdgeInsets.only(top: 10.h,left: 10.w),
            child: Title2Text("메시지", kTextBlackColor),
          )
        ],
      ),
    );
  }
}
