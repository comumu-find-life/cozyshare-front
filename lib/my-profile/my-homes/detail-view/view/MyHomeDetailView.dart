
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_and_job/constants/Colors.dart';
import 'package:home_and_job/constants/Fonts.dart';
import 'package:home_and_job/my-profile/my-homes/detail-view/controller/MyHomeDetailController.dart';
import 'package:home_and_job/room/room-detail/widgets/HomeImagesWidget.dart';

import '../../../../room/room-detail/controller/HomeDetailController.dart';
import '../../../../room/room-detail/widgets/HomeHeaderWidget.dart';
import '../../../../room/room-detail/widgets/HomeOptionsWidget.dart';
import '../../../../room/room-detail/widgets/HomeOverViewWidget.dart';
import '../../../../room/room-detail/widgets/HomePriceWidget.dart';
import '../widgets/MyHomeDetailAppBar.dart';

class MyHomeDetailView extends StatelessWidget {
  final int homeId;


  MyHomeDetailView(this.homeId);

  @override
  Widget build(BuildContext context) {

    HomeDetailController _controller = HomeDetailController();
    
    return FutureBuilder(future: _controller.loadHomeInformation(homeId), builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
      if(snapshot.connectionState == ConnectionState.waiting){
        return Center(
          child: CircularProgressIndicator()
        );
      }
      else if(snapshot.hasError){
        return Center(
          child: Body2Text("ERROR", kTextBlackColor),
        );
      }

      else{
        return Scaffold(
          appBar: MyHomeDetailAppBar(context),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                HomeImagesWidget(_controller),
                HomeHeaderWidget(_controller.homeInformationResponse!),
                Container(
                  margin: EdgeInsets.only(top: 30.h),
                  width: 380.w,
                  height: 1.h,
                  color: kGrey200Color,
                ),
                HomePriceWidget(_controller.homeInformationResponse!),
                Container(
                  margin: EdgeInsets.only(top: 30.h),
                  width: 380.w,
                  height: 1.h,
                  color: kGrey200Color,
                ),
                HomeOverViewWidget(_controller),
                Container(
                  margin: EdgeInsets.only(top: 30.h),
                  width: 380.w,
                  height: 1.h,
                  color: kGrey200Color,
                ),
                HomeOptionsWidget(_controller.homeInformationResponse!),
              ],
            ),
          ),
        );
      }
    }, );
  }
}
