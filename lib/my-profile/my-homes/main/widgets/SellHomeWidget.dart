import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:home_and_job/model/home/response/HomeOverviewResponse.dart';
import 'package:home_and_job/my-profile/my-homes/edit-home/popup/AskSoldOutPopup.dart';
import 'package:home_and_job/my-profile/my-homes/edit-home/view/HomeEditView.dart';

import '../../../../constants/Colors.dart';
import '../../../../constants/Fonts.dart';
import '../../detail-view/view/MyHomeDetailView.dart';
import '../../edit-home/controller/HomeEditController.dart';
import '../controller/MyHomeListController.dart';


class SellHomeWidget extends StatelessWidget {
  final HomeOverviewResponse home;
  final MyHomeListController controller;
  SellHomeWidget(this.home, this.controller);

  //todo soldout 팝업
  //AskSoldOutPopup().showDialog(_controller, context);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {

        //Get.to(() => MyHomeDetailView(home.id));
      },
      child: Container(
          margin: EdgeInsets.only(top: 10.h),
          height: 150.h,
          width: 380.w,
          decoration: BoxDecoration(
            color: kWhiteColor,
            border: Border(
              bottom: BorderSide(color: Colors.grey.withOpacity(0.3)),
            ),
          ),
          child:  Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              _buildImage(),
              Container(
                margin: EdgeInsets.only(left: 10.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildAddress(),
                    _buildPrice(),
                    _buildButtons(controller, home.id,context),
                  ],
                ),
              )
            ],
          ),),
    );
  }

  Widget _buildButtons(MyHomeListController _controller, int homeId,BuildContext context){
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InkWell(
          onTap: (){
            AskSoldOutPopup().showDialog(_controller, homeId ,context);
          },
          child: Container(
            margin: EdgeInsets.only(top: 17.h),
            width: 90.w,
            height: 35.h,
            decoration: BoxDecoration(
                border: Border.all(color: kGrey300Color),
                color: kGrey100Color,
                borderRadius: BorderRadius.all(Radius.circular(4))
            ),
            child: Center(
              child: Body2Text("Sold Out", kGrey700Color),
            ),
          ),
        ),
        InkWell(
          onTap: (){

            Get.to(() => HomeEditView(home), transition: Transition.noTransition);
          },
          child: Container(
            margin: EdgeInsets.only(top: 17.h, left: 5.w),
            width: 130.w,
            height: 35.h,
            decoration: BoxDecoration(
                border: Border.all(color: kGrey300Color),
                color: kGrey100Color,
                borderRadius: BorderRadius.all(Radius.circular(4))
            ),
            child: Center(
              child: Body2Text("Edit ", kGrey700Color),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPrice() {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          //top: BorderSide(color: kGrey200Color)
        )
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          Row(
            children: [
              Container(
                margin: EdgeInsets.only(top: 10.h),
                width: 100.w,
                height: 20.h,
                child: FRegularText("Bond \$${home.bond}", kGrey700Color, 14),
              ),
              Container(
                margin: EdgeInsets.only(top: 5.h),
                width: 100.w,
                height: 20.h,
                child: FRegularText("Rent \$${home.rent}", kGrey700Color, 14),
              ),
            ],
          ),

        ],
      ),
    );
  }

  Widget _buildAddress() {
    return Container(
      margin: EdgeInsets.only(top: 20.h),
      width: 200.w,
      child: FBoldText("${home.address}", kGrey700Color, 15),
    );
  }

  Widget _buildImage() {
    return Container(
      margin: EdgeInsets.only(left: 13.w, top: 17.h),
      width: 100.w,
      height: 125.h,
      child: ClipRRect(
          borderRadius: BorderRadius.circular(3.0),
          child: Image.asset(
            "assets/images/test/home.png",
            fit: BoxFit.cover,
          )),
    );
  }
}
