import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_and_job/constants/Colors.dart';
import 'package:home_and_job/constants/Fonts.dart';
import 'package:home_and_job/my-profile/my-homes/edit-home/widgets/HomeEditBottonWidget.dart';
import 'package:home_and_job/my-profile/my-homes/edit-home/widgets/HomeEditAddressWidget.dart';
import 'package:home_and_job/my-profile/my-homes/edit-home/widgets/HomeEditImagesWidget.dart';
import 'package:home_and_job/my-profile/my-homes/edit-home/widgets/HomeEditIntroduceViewWidget.dart';
import 'package:home_and_job/my-profile/my-homes/edit-home/widgets/HomeEditOptionsWidget.dart';

import '../../../../model/home/response/HomeOverviewResponse.dart';
import '../../../../room/room-detail/widgets/HomePriceWidget.dart';
import '../controller/HomeEditController.dart';
import '../widgets/HomeEditPriceWidget.dart';

class HomeEditView extends StatelessWidget {
  HomeOverviewResponse _home;

  HomeEditView(this._home);

  @override
  Widget build(BuildContext context) {
    HomeEditController _controller = HomeEditController();

    return FutureBuilder(
      future: _controller.loadInit(_home.id),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasError) {
          return Body2Text("Error", kTextBlackColor);
        } else {
          return Scaffold(
            appBar: AppBar(),
            bottomSheet: HomeEditBottomWidget(_controller, context),
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  HomeEditImagesWidget(_controller),
                  _buildLine(),
                  HomeEditAddressWidget(_controller),
                  _buildLine(),
                  HomeEditPriceWidget(_controller),
                  _buildLine(),
                  HomeEditIntroduceViewWidget(_controller),
                  _buildLine(),
                  HomeEditOptionsWidget(),
                ],
              ),
            ),
          );
        }
      },
    );
  }

  Widget _buildLine(){
    return Center(
      child: Container(
        margin: EdgeInsets.only(top: 30.h),
        width: 340.w,
        height: 1.h,
        color: kGrey100Color,
      ),
    );
  }
}
