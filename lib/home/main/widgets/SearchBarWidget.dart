import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:home_and_job/constants/Fonts.dart';
import 'package:home_and_job/search/search-address/view/SearchAddressView.dart';

import '../../../constants/Colors.dart';

class SearchBarWidget extends StatefulWidget {
  const SearchBarWidget({super.key});

  @override
  State<SearchBarWidget> createState() => _SearchBarWidgetState();
}

class _SearchBarWidgetState extends State<SearchBarWidget> {
  String cityName = "";

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10.h, bottom: 15.h),
      height: 45.h,
      width: 340.w,
      decoration: BoxDecoration(
          border: Border.all(color: kGrey300Color),
          borderRadius: BorderRadius.all(Radius.circular(6))),
      child: InkWell(
        onTap: () async {
          cityName = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => SearchAddressView()),
          );
          // Do something with the selected city
          print('Selected city: $cityName');
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            cityName == ""
                ? Container(
                    margin: EdgeInsets.only(left: 10.w),
                    child: HintText3("주소 검색", kGrey300Color),
                  )
                : Container(
                    margin: EdgeInsets.only(left: 10.w),
                    child: HintText3(cityName, kGrey300Color),
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
    );
  }
}
