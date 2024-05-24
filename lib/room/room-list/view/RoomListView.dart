import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_and_job/constants/Colors.dart';
import '../../../model/home/response/HomeResponse.dart';
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
    RoomListController _controller = RoomListController(cityName);

    List<HomeResponse> homes = [
      homeResponseTest1,
      homeResponseTest2,
      homeResponseTest3,
      homeResponseTest4,
      homeResponseTest5,
    ];

    return Scaffold(
      appBar: HomeAppBar(_controller),
      backgroundColor: kWhiteBackGroundColor,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            HomeListFilter(_controller),
            Container(
              margin: EdgeInsets.only(bottom: 10.h),
              width: 380.w,
              child: Column(
                children: homes.map((home) {
                  return HomeListItemWidget(home);
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
