

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../constants/Colors.dart';

AppBar SearchCityAppBar(BuildContext context, TextEditingController _searchController) {
  return AppBar(
    elevation: 0,
    toolbarHeight: 80.h,
    centerTitle: true,
    backgroundColor: kWhiteBackGroundColor,
    automaticallyImplyLeading: false,
    title: Container(
      width: 360.w,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: () {
              //여기에 코드 구현

              Navigator.pop(context);
            },
            child: Container(
                width: 11.w, height: 19.h, child: Icon(Icons.arrow_back_ios)),
          ),
          Container(
            margin: EdgeInsets.only(left: 3.w, top: 3.h),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(6)),
                border: Border.all(color: kGrey300Color)),
            width: 315.w,
            height: 37.h,
            child: Row(
              children: [
                Container(
                  margin: EdgeInsets.only(left: 10.w),
                  width: 250.w,
                  child: TextField(
                    controller: _searchController,
                    // onChanged: (value) {
                    //   // Delay filtering to avoid frequent rebuilds
                    //   Future.delayed(Duration(milliseconds: 300), () {
                    //     filterCities(value);
                    //   });
                    // },
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      hintText: 'Search City',
                      hintStyle:
                      TextStyle(color: kGrey400Color, fontSize: 15.sp),
                      focusColor: kTextBlackColor,
                      border: InputBorder.none,
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: Container(
                    margin: EdgeInsets.only(left: 20.w),
                    child: Icon(
                      Icons.search,
                      color: kTextBlackColor,
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    ),
  );
}