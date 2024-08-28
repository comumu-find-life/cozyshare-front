import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_and_job/constants/Colors.dart';
import 'package:home_and_job/constants/Fonts.dart';
import 'package:home_and_job/model/user/response/UserProfileResponse.dart';

class ProfileDetailHeader extends StatelessWidget {

  UserProfileResponse _userProfileResponse;


  ProfileDetailHeader(this._userProfileResponse);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: EdgeInsets.only(top: 20.h,right: 200.w),
        width: 140.w,


        child: Row(
          children: [
            Center(
              child: Container(
                width: 55.w,
                height: 55.h,
                child: CircleAvatar(
                  backgroundColor: kGrey200Color,
                  backgroundImage: AssetImage("assets/images/test/man.png"),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 10.w),
              child: Body2Text("${_userProfileResponse.nickname}", kTextBlackColor),
            )

          ],
        ),
      ),
    );
  }
}
