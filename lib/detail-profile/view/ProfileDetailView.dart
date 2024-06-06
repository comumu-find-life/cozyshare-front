import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_and_job/common-widgets/app-bar/CommonAppbar.dart';
import 'package:home_and_job/constants/Colors.dart';

import '../../constants/Fonts.dart';
import '../controller/ProfileDetailController.dart';
import '../widgets/ProfileDetailBody.dart';
import '../widgets/ProfileDetailHeader.dart';

class ProfileDetailView extends StatelessWidget {
  int userIdx;

  ProfileDetailView(this.userIdx);

  @override
  Widget build(BuildContext context) {
    ProfileDetailController _controller = ProfileDetailController();
    return FutureBuilder(future: _controller.loadUserProfile(userIdx), builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
      if(snapshot.connectionState == ConnectionState.waiting){
        return Center(
          child: CircularProgressIndicator(),
        );
      }else if(snapshot.hasError){
        return Body2Text("ERROR", kTextBlackColor);
      }else{
        return Scaffold(
          backgroundColor: kDarkBlue,
          appBar: _buildAppbar(context),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    ProfileDetailBody(),
                    ProfileDetailHeader(),
                  ],
                )
              ],
            ),
          ),
        );
      }

    }, );
  }

  AppBar _buildAppbar(BuildContext context) {
    return AppBar(
      elevation: 0,
      centerTitle: true,
      backgroundColor: kDarkBlue,
      automaticallyImplyLeading: false,
      title: Container(
        width: 360.w,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: () {
                //여기에 코드 구현

                Navigator.pop(context);
              },
              child: Container(
                  width: 11.w,
                  height: 19.h,
                  child: Icon(
                    Icons.arrow_back_ios,
                    color: kWhiteBackGroundColor,
                  )),
            ),
            Container()
          ],
        ),
      ),
    );
  }
}
