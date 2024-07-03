import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_and_job/common-widgets/app-bar/CommonAppbar.dart';
import 'package:home_and_job/constants/Colors.dart';
import 'package:home_and_job/constants/Fonts.dart';
import 'package:home_and_job/my-profile/my-homes/api/MyHomeApi.dart';

import '../../../../model/home/response/HomeOverviewResponse.dart';
import '../controller/MyHomeListController.dart';
import '../widgets/IntroduceProfileWidget.dart';
import '../widgets/MyHomeListItem.dart';

class MyHomeListView extends StatelessWidget {
  const MyHomeListView({super.key});

  @override
  Widget build(BuildContext context) {
    MyHomeListController _controller = MyHomeListController();
    return Scaffold(
      appBar: CommonAppBar(
        canBack: true,
        color: kWhiteBackGroundColor,
        title: "",
      ),
      body: FutureBuilder(future: _controller.loadMyHomes(), builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        if(snapshot.connectionState == ConnectionState.waiting){
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if(snapshot.hasError){
          return Container(
            child: Body2Text("Networ Error", kTextBlackColor),
          );
        }else{
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IntroduceProfileWidget(),
                //todo HomeOverviewResponse 로 대입
                Container(
                    width: 380.w,
                    height: 710.h,
                    child: ListView.builder(
                        physics: BouncingScrollPhysics(),
                        itemCount: _controller.myHomes.length,
                        itemBuilder: (BuildContext ctx, int idx) {
                          return MyHomeListItem(_controller.myHomes[idx]);
                        }))
              ],
            ),
          );
        }
      },)
    );
  }
}
