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
    return Container(
      decoration: BoxDecoration(
        color: kPrimaryColor,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(14),
          bottomRight: Radius.circular(14),
        ),
      ),
      child: Center(
        child: Column(
          children: [
            Center(
              child: Container(
                width: 95, // 너비
                height: 95, // 높이
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: kWhiteColor, width: 2), // 테두리 색상 및 두께
                ),
                child: ClipOval( // 이미지를 원 형태로 자르기
                  child: Image.asset(
                    "assets/images/test/man.png",
                    fit: BoxFit.cover, // 이미지 크기 맞추기
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 10.w, top: 15.h),
              child: FBoldText("${_userProfileResponse.nickname}", kWhiteColor, 14),
            ),
            _buildJob(),
            _buildNationality(),
          ],
        ),
      ),
    );
  }

  Widget _buildNationality() {
    return Container(
      margin: EdgeInsets.only(top: 13.h, bottom: 20.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.only(right: 3.w),
            child: Icon(Icons.location_on, color: kWhiteColor, size: 15.sp,),
          ),
          Container(

            child: FRegularText("${_userProfileResponse.nationality}", kWhiteColor, 14),

          ),
        ],
      ),
    );
  }

  Widget _buildJob() {
    return Container(
      margin: EdgeInsets.only(top: 12.h, left: 10.w),
      child:  Container(
        child: FRegularText("${_userProfileResponse.job} / ${_userProfileResponse.gender}", kWhiteColor, 14),
      ),
    );
  }
}
