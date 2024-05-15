import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_and_job/common-widgets/app-bar/CommonAppbar.dart';
import 'package:home_and_job/constants/Colors.dart';

import '../../../../model/home/response/HomeResponse.dart';
import '../widgets/IntroduceProfileWidget.dart';
import '../widgets/MyHomeListItem.dart';

class MyHomeListView extends StatelessWidget {
  const MyHomeListView({super.key});

  @override
  Widget build(BuildContext context) {
    List<HomeResponse> homes = [
      homeResponseTest1,
      homeResponseTest2,
      homeResponseTest3,
      homeResponseTest4,
      homeResponseTest5
    ];

    return Scaffold(
      appBar: CommonAppBar(
        canBack: true,
        color: kWhiteBackGroundColor,
        title: "",
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IntroduceProfileWidget(),
            Container(
                width: 380.w,
                height: 710.h,
                child: ListView.builder(
                    physics: BouncingScrollPhysics(),
                    itemCount: homes.length,
                    itemBuilder: (BuildContext ctx, int idx) {
                      return MyHomeListItem(homes[idx]);
                    }))
          ],
        ),
      ),
    );
  }
}
