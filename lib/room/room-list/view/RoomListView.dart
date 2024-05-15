import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_and_job/constants/Colors.dart';
import '../../../model/home/response/HomeResponse.dart';
import '../controller/RoomListController.dart';
import '../widgets/HomeAppBar.dart';
import '../widgets/HomeListItemWidget.dart';
import '../widgets/SearchBarWidget.dart';

class RoomListView extends StatelessWidget {
  String cityName;


  RoomListView(this.cityName);



  @override
  Widget build(BuildContext context) {
    RoomListController _controller = RoomListController(cityName);

    List<HomeResponse> homes = [
      homeResponseTest1,
      homeResponseTest2,
      homeResponseTest3,
      homeResponseTest4,
      homeResponseTest5
    ];

    return Scaffold(
      //floatingActionButton: OldGoalFloatingButton(),
      appBar: HomeAppBar(),
      backgroundColor: kWhiteBackGroundColor,

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SearchBarWidget(_controller),
            //SelectHomeTypeWidget(_controller),
            Container(
                width: 380.w,
                height: 640.h,
                child: ListView.builder(
                    physics: BouncingScrollPhysics(),
                    itemCount: homes.length,
                    itemBuilder: (BuildContext ctx, int idx) {
                      return HomeListItemWidget(homes[idx]);
                    }))
            //HomeListWidget(_controller)
          ],
        ),
      ),
    );
  }
}
