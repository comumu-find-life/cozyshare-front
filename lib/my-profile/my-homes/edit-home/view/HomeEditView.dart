
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_and_job/constants/Colors.dart';
import 'package:home_and_job/my-profile/my-homes/edit-home/widgets/HomeEditHeaderWidget.dart';
import 'package:home_and_job/my-profile/my-homes/edit-home/widgets/HomeEditImagesWidget.dart';
import 'package:home_and_job/my-profile/my-homes/edit-home/widgets/HomeEditIntroduceViewWidget.dart';
import 'package:home_and_job/my-profile/my-homes/edit-home/widgets/HomeEditOptionsWidget.dart';

import '../../../../room/room-detail/widgets/HomePriceWidget.dart';

class HomeEditView extends StatelessWidget {
  const HomeEditView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HomeEditImagesWidget(),
            HomeEditHeaderWidget(),
            Center(
              child: Container(
                margin: EdgeInsets.only(top: 20.h),
                width: 340.w,
                height: 1.h,
                color: kGrey100Color,
              ),
            ),
            //HomePriceWidget(),
            HomeEditIntroduceViewWidget(),
            HomeEditOptionsWidget(),
          ],
        ),
      ),
    );
  }
}
