import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_and_job/constants/Colors.dart';
import 'package:home_and_job/constants/Fonts.dart';

import '../controller/MainController.dart';

class SelectTypeWidget extends StatelessWidget {
  MainController controller;

  SelectTypeWidget(this.controller);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: EdgeInsets.only(top: 40.h),
        width: 340.w,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildSelectHome(),
            _buildSelectJob()

          ],
        ),
      ),
    );
  }

  Widget _buildSelectHome(){
    return Container(
      child: Column(
        children: [
          InkWell(
            onTap: (){
              controller.moveToHomeView();
            },
            child: Container(
              width: 150.w,
              height: 200.h,
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.4),
                      blurRadius: 3.0,
                      spreadRadius: 0.0,
                      offset: const Offset(0,2),
                    )
                  ],
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  border: Border.all(color: kGrey200Color),
                  color: kWhiteBackGroundColor),
              child: Column(
                children: [
                  Container(
                      margin: EdgeInsets.only(top: 50.h),
                      child: Icon(
                        Icons.home_filled,
                      )),
                  Container(
                    margin: EdgeInsets.only(top: 10.h),
                    child: Body1Text("집 알아보기", kTextBlackColor),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildSelectJob(){
    return Container(

      child: Column(
        children: [
          InkWell(
            onTap: (){
              controller.moveToHomeView();
            },
            child: Container(
              width: 150.w,
              height: 200.h,
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.4),
                      blurRadius: 3.0,
                      spreadRadius: 0.0,
                      offset: const Offset(0,2),
                    )
                  ],
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  border: Border.all(color: kGrey200Color),
                  color: kWhiteBackGroundColor),
              child: Column(
                children: [
                  Container(
                      margin: EdgeInsets.only(top: 50.h),
                      child: Icon(
                        Icons.work_outline,
                      )),
                  Container(
                    margin: EdgeInsets.only(top: 10.h),
                    child: Body1Text("일자리 알아보기", kTextBlackColor),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
