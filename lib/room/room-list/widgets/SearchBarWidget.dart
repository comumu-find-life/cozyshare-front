import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:home_and_job/constants/Fonts.dart';
import 'package:home_and_job/search/search-address/view/SearchAddressView.dart';

import '../../../constants/Colors.dart';
import '../controller/RoomListController.dart';

class SearchBarWidget extends StatelessWidget {


  RoomListController _controller;


  SearchBarWidget(this._controller);

  @override
  Widget build(BuildContext context) {
    return Obx(() => Container(
      margin: EdgeInsets.only(top: 10.h, bottom: 15.h),
      height: 45.h,
      width: 340.w,
      decoration: BoxDecoration(
          border: Border.all(color: kGrey300Color),
          borderRadius: BorderRadius.all(Radius.circular(6))),
      child: InkWell(
        onTap: () async {
          await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => SearchAddressView()),
          );
          // Do something with the selected city
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _controller.cityName == ""
                ? Container(
              margin: EdgeInsets.only(left: 10.w),
              child: HintText3("Search By City", kGrey300Color),
            )
                : Container(
              margin: EdgeInsets.only(left: 10.w),
              child: HintText3("${_controller.cityName}", kGrey600Color),
            ),
            Container(
              margin: EdgeInsets.only(right: 10.w),
              child: Icon(
                Icons.search,
                color: kGrey300Color,
              ),
            )
          ],
        ),
      ),
    ));
  }
}
