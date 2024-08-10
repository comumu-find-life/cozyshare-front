import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:home_and_job/common-widgets/app-bar/CommonAppbar.dart';
import 'package:home_and_job/constants/Colors.dart';
import 'package:home_and_job/my-profile/my-deals/cancel-detail/DealCancelView.dart';
import 'package:home_and_job/my-profile/my-deals/done-detail/view/DealDoneDetailView.dart';
import 'package:home_and_job/my-profile/my-deals/main/controller/MyDealListController.dart';
import 'package:home_and_job/my-profile/my-deals/main/widgets/DuringDealWidget.dart';

import '../../../../constants/Fonts.dart';
import '../widgets/SelectDealTypeWidget.dart';

class MyDealListView extends StatelessWidget {
  const MyDealListView({super.key});

  @override
  Widget build(BuildContext context) {
    MyDealListController _controller = MyDealListController();
    return Scaffold(
      backgroundColor: kWhiteBackGroundColor,
      appBar: CommonAppBar(
        canBack: true,
        title: '',
        color: kWhiteBackGroundColor,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SelectDealTypeWidget(_controller),
            DuringDealWidget(),
            InkWell(
              onTap: (){
                Get.to(() => DealDoneDetailView());
              },
              child: Container(
                child: Body2Text("DealDoneDetailView", kTextBlackColor),
              ),
            ),

            InkWell(
              onTap: (){
                Get.to(() => DealCancelDetailView());
              },
              child: Container(
                child: Body2Text("CANCEL", kTextBlackColor),
              ),
            )
          ],
        ),
      ),
    );
  }
}
