import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:home_and_job/constants/Colors.dart';
import 'package:home_and_job/constants/Fonts.dart';
import 'package:home_and_job/room/api/RoomApi.dart';
import '../../../model/home/response/HomeOverviewResponse.dart';
import '../controller/RoomListController.dart';
import '../widgets/HomeAppBar.dart';
import '../widgets/HomeListItemWidget.dart';
import '../widgets/SearchBarWidget.dart';
import '../widgets/HomeListFilter.dart';

class RoomListView extends StatelessWidget {
  final String cityName;

  RoomListView(this.cityName);

  @override
  Widget build(BuildContext context) {
    RoomListController _controller = RoomListController();

    return Scaffold(
        appBar: HomeAppBar(_controller),
        backgroundColor: kWhiteBackGroundColor,
        body: FutureBuilder(
          future: _controller.loadAllHomes(cityName),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              return Container(
                child: Body2Text("Network Error", kTextBlackColor),
              );
            } else {
              return SingleChildScrollView(
                  child: Obx(() => Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [

                          HomeListFilter(_controller),
                          _controller.cityName == ""
                              ? Container(
                                  margin: EdgeInsets.only(bottom: 10.h),
                                  width: 380.w,
                                  child: Column(
                                    children: _controller.homes.map((home) {
                                      return HomeListItemWidget(home);
                                    }).toList(),
                                  ),
                                )
                              : _controller.filterCityHomes.length != 0
                                  ? Container(
                                      margin: EdgeInsets.only(bottom: 10.h),
                                      width: 380.w,
                                      child: Column(
                                        children: _controller.filterCityHomes
                                            .map((home) {
                                          return HomeListItemWidget(home);
                                        }).toList(),
                                      ),
                                    )
                                  : _buildNotItem()
                        ],
                      )));
            }
          },
        ));
  }

  Widget _buildNotItem() {
    return Container(
      margin: EdgeInsets.only(left: 15.w, right: 15.w),
      width: 360.w,
      height: 650.h,
      decoration: BoxDecoration(
          border: Border.all(color: kGrey300Color),
          borderRadius: BorderRadius.all(Radius.circular(6))),
      child: Center(
        child: FRegularText(
            "There are no home posts in your area.", kGrey300Color, 14),
      ),
    );
  }
}
