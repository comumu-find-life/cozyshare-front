
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
        margin: EdgeInsets.only(top: 30.h,left: 20.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [

            Row(
              children: [
                Container(
                  child: CircleAvatar(
                    backgroundColor: kGrey200Color,
                    backgroundImage: AssetImage("assets/images/test/user.png"),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 15.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(width: 280.w,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              child: Body1Text("사용자 닉네임", kTextBlackColor),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 10.w),
                              child: HelperText("02.15", kGrey500Color),
                            )
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 5.h),
                        child: Body2Text("방 있나요?", kGrey600Color),
                      )
                    ],
                  ),
                ),

              ],
            ),
            // Container(
            //   margin: EdgeInsets.only(right: 20.w),
            //   width: 50.w,
            //   height: 30.h,
            //   decoration: BoxDecoration(
            //       color: kErrorColor,
            //       borderRadius: BorderRadius.all(Radius.circular(10))
            //   ),
            //
            //   child: Center(
            //     child: Body2Text("안 읽음", kWhiteBackGroundColor),
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}
