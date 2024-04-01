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
      appBar: CommonAppBar(
        canBack: false,
        title: "메시지",
        color: kWhiteBackGroundColor,
      ),
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
}
