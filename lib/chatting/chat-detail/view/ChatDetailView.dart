import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_and_job/chatting/chat-detail/mode/User.dart';
import 'package:home_and_job/chatting/chat-detail/widgets/MyMessageWidget.dart';
import 'package:home_and_job/chatting/chat-detail/widgets/OpponentMessageWidget.dart';
import 'package:home_and_job/common-widgets/app-bar/CommonAppbar.dart';
import 'package:home_and_job/constants/Colors.dart';
import 'package:home_and_job/constants/Fonts.dart';

import '../widgets/ChatComposer.dart';
import '../widgets/Conversation.dart';

class ChatDetailView extends StatefulWidget {
  final User user;

  @override
  State<ChatDetailView> createState() => _ChatDetailViewState();

  ChatDetailView(this.user);
}

class _ChatDetailViewState extends State<ChatDetailView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: _buildAppBar(),
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
                        decoration: BoxDecoration(
                          color: kWhiteBackGroundColor,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(0),
                            topRight: Radius.circular(0),
                          ),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30),
                          ),
                          child: Conversation(widget.user),
                        ),
                      ),
                    ),
                    buildChatComposer()
                  ],
                ),
              ),
            ),
            _buildPostInformation(),
          ],
        ));
  }

  Widget _buildPostInformation(){
    return Container(
      width: 380.w,
      height: 70.h,
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.grey.withOpacity(0.2)),
        ),
        color: kWhiteBackGroundColor,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                  margin: EdgeInsets.only(left: 10.w),
                  width: 85.w,
                  height: 60.h,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                      "assets/images/test/home.png",
                      fit: BoxFit.cover,
                    ),
                  )),
              Container(
                margin: EdgeInsets.only(left: 10.w, top: 10.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: Body2Text("WAC Melbulan", kTextBlackColor),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 3.h),
                      child: HintText("보증금:3000", kGrey500Color),
                    )
                  ],
                ),
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.only(right: 10.w),
            child: Icon(
              Icons.location_on_sharp,
              color: kChatPrimaryColor,
            ),
          )
        ],
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: kDarkBlue,
      toolbarHeight: 50,
      title: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                        child: Icon(
                          Icons.arrow_back_ios,
                          color: kWhiteBackGroundColor,
                        )),
                  ),
                  Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 3.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [SubTitle1Text("신민석", kWhiteBackGroundColor)],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              InkWell(
                onTap: (){
                  // 안전거래 시작 로직
                },
                child: Container(
                  width: 80.w,
                  height: 35.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                    color: kLightBlue
                  ),
                  child: Center(child: SubTitle2Text("안전거래", kWhiteBackGroundColor)),
                ),
              )
            ],
          ),
        ],
      ),
      automaticallyImplyLeading: false,
      elevation: 0,
    );
  }
}
