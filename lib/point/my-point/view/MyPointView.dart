
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_and_job/common-widgets/app-bar/CommonAppbar.dart';
import 'package:home_and_job/constants/Colors.dart';
import 'package:home_and_job/constants/Fonts.dart';
import 'package:home_and_job/model/user/response/UserAccountResponse.dart';
import 'package:home_and_job/point/register-account/view/RegisterAccountView.dart';
import 'package:home_and_job/rest-api/user-api/ProfileDetailApi.dart';
import 'package:home_and_job/utils/DiskDatabase.dart';

import '../widgets/MyPointHeader.dart';
import '../controller/MyPointController.dart';
import '../widgets/MyPointHistory.dart';

class MyPointView extends StatelessWidget {
  UserAccountResponse userAccountResponse;


  MyPointView(this.userAccountResponse);

  @override
  Widget build(BuildContext context) {
    MyPointController _controller = MyPointController();
    return Scaffold(
      backgroundColor: kWhiteBackGroundColor,
      appBar: CommonAppBar(canBack: true, title: '', color: kWhiteBackGroundColor,),
      body: FutureBuilder(     future: _controller.loadInit(userAccountResponse),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              return Container(
                child: Body2Text("Networ Error", kTextBlackColor),
              );
            } else {
              return !_controller.isExistUserAccount()?RegisterAccountView():SingleChildScrollView(
                child: Column(
                  children: [
                    MyPointHeader(_controller),
                    MyPointHistory(_controller),
                  ],

                ),
              );
            }
    })
    );
  }

}


