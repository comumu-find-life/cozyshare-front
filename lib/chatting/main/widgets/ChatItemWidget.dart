
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:home_and_job/chatting/chat-detail/mode/User.dart';
import 'package:home_and_job/chatting/chat-detail/view/ChatDetailView.dart';

import '../../../constants/Colors.dart';
import '../../../constants/Fonts.dart';

class ChatItemWidget extends StatelessWidget {



  @override
  Widget build(BuildContext context) {

    final User user = currentUser;
    return InkWell(
      onTap: (){
        Get.to(() => ChatDetailView(user));
      },
      child: Container(
        decoration: BoxDecoration(

        ),
        margin: EdgeInsets.only(top: 30.h,left: 20.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [

            Row(
              children: [
                Container(
                  child: CircleAvatar(
                    backgroundColor: kGrey200Color,
                    backgroundImage: AssetImage("assets/images/test/man.png"),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 15.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(width: 250.w,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              child: Body1Text("신민석", kTextBlackColor),
                            ),

                          ],
                        ),
                      ),
                      Row(
                        children: [
                          Container(
                            margin: EdgeInsets.only(top: 5.h),
                            child: Body2Text("방 있나요?", kGrey600Color),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 10.w),
                            child: HelperText("02.15", kGrey500Color),
                          )
                        ],
                      )
                    ],
                  ),
                ),

              ],
            ),
            Container(
              width: 28.w,
              height: 28.h,
              margin: EdgeInsets.only(right: 10.w),
              decoration: BoxDecoration(

                shape: BoxShape.circle,
                color: kErrorColor
              ),
              child: Center(child: ButtonText("1", kWhiteBackGroundColor)),
            ),


          ],
        ),
      ),
    );
  }
}
