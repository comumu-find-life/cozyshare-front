import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../constants/Colors.dart';
import '../../../constants/Fonts.dart';
import '../controller/FilterController.dart';

class PriceFilterWidget extends StatelessWidget {
  FilterController _controller;


  PriceFilterWidget(this._controller);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 380.w,
      height: 280.h,
      color: kWhiteBackGroundColor,
      margin: EdgeInsets.only(top: 2.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(top: 30.h,left: 18.w),
            child: FBoldText("Rent Price", kTextBlackColor, 14),
          ),
          _buildForm()
        ],
      ),
    );
  }

  Widget _buildForm(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          child: Row(
            children: [
              _buildMinPriceForm(),
              _buildMaxPriceForm()
            ],
          ),
        ),
        _buildBondForm(),
      ],
    );
  }

  Widget _buildMinPriceForm(){
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.only(left: 18.w,top: 20.h),
          child: FRegularText("Rent min", kTextBlackColor, 14),
        ),
        Container(
            margin: EdgeInsets.only(left: 18.w, top: 10.h),
            width: 160.w,
            height: 55.h,
            decoration: BoxDecoration(
                border: Border.all(color: kGrey600Color),
                borderRadius: BorderRadius.all(Radius.circular(6))
            ),
            child: Row(
              children: [
                Container(
                  margin: EdgeInsets.only(left: 10.w,right: 7.w, top: 3.h),
                  child: FBoldText("\$", kTextBlackColor, 14),
                ),
                Container(
                  width: 130.w,
                  child: TextField(
                    controller: _controller.minRentController,
                    // onChanged: (value) {
                    //   // Delay filtering to avoid frequent rebuilds
                    //   Future.delayed(Duration(milliseconds: 300), () {
                    //     filterCities(value);
                    //   });
                    // },
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      hintText: 'Any',
                      hintStyle: TextStyle(color: kGrey400Color, fontSize: 15.sp),
                      focusColor: kTextBlackColor,
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ],
            )
        ),
      ],
    );
  }

  Widget _buildBondForm(){
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.only(left: 18.w,top: 20.h),
          child: FRegularText("Max Bond", kTextBlackColor, 14),
        ),
        Container(
            margin: EdgeInsets.only(left: 18.w, top: 10.h),
            width: 340.w,
            height: 55.h,
            decoration: BoxDecoration(
                border: Border.all(color: kGrey600Color),
                borderRadius: BorderRadius.all(Radius.circular(6))
            ),
            child: Row(
              children: [
                Container(
                  margin: EdgeInsets.only(left: 10.w,right: 7.w, top: 3.h),
                  child: FBoldText("\$", kTextBlackColor, 14),
                ),
                Container(
                  width: 300.w,
                  child: TextField(
                    keyboardType: TextInputType.number,
                    controller: _controller.maxBondController,
                    
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      hintText: 'Any',
                      hintStyle: TextStyle(color: kGrey400Color, fontSize: 15.sp),
                      focusColor: kTextBlackColor,
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ],
            )
        ),
      ],
    );
  }

  Widget _buildMaxPriceForm(){
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.only(left: 18.w,top: 20.h),
          child: FRegularText("Rent max", kTextBlackColor, 14),
        ),
        Container(
            margin: EdgeInsets.only(left: 18.w, top: 10.h),
            width: 160.w,
            height: 55.h,
            decoration: BoxDecoration(
                border: Border.all(color: kGrey600Color),
                borderRadius: BorderRadius.all(Radius.circular(6))
            ),
            child: Row(
              children: [
                Container(
                  margin: EdgeInsets.only(left: 10.w,right: 7.w, top: 3.h),
                  child: FBoldText("\$", kTextBlackColor, 14),
                ),
                Container(
                  width: 130.w,
                  child: TextField(
                    keyboardType: TextInputType.number,
                    controller: _controller.maxRentController,
                    // onChanged: (value) {
                    //   // Delay filtering to avoid frequent rebuilds
                    //   Future.delayed(Duration(milliseconds: 300), () {
                    //     filterCities(value);
                    //   });
                    // },
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      hintText: 'Any',
                      hintStyle: TextStyle(color: kGrey400Color, fontSize: 15.sp),
                      focusColor: kTextBlackColor,
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ],
            )
        ),
      ],
    );
  }
}
