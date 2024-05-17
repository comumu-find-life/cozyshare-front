


import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../constants/Colors.dart';
import '../controller/SearchAddressController.dart';

PreferredSize SearchAddressAppBar(BuildContext context, SearchAddressController _controller){
  return PreferredSize(
    preferredSize: Size.fromHeight(65.h),
    child: AppBar(
      backgroundColor: kWhiteBackGroundColor,
      automaticallyImplyLeading: false,
      title: Container(
        width: 360.w,
        child: Row(

          children: [
            InkWell(
              onTap: (){
                Navigator.pop(context);
              },
              child: Container(
                margin: EdgeInsets.only(top: 5.h),
                child: Icon(Icons.arrow_back_ios, size: 17.sp,),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10.h, bottom: 0.h, left: 10.w),
              width: 310.w,
              height: 40.h,
              decoration: BoxDecoration(
                  border: Border.all(color: kGrey300Color),
                  borderRadius: BorderRadius.all(Radius.circular(20))
              ),
              child: TextField(

                controller: _controller.searchController,

                style: TextStyle(color: Colors.black), // 입력된 텍스트의 색상을 검정색으로 변경
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.only(left: 10.w, top: 5.w),
                  hintText: 'Search By City',
                  hintStyle: TextStyle(color: kGrey500Color, fontSize: 14, fontFamily: "FRegular" ),
                  border: InputBorder.none,
                  suffixIcon: IconButton(
                    icon: Icon(Icons.search),
                    onPressed: () async {
                      //_controller.searchAddresses();
                      //await _searchAddresses(_searchController.text);
                    },
                  ),
                ),
                onChanged: (query) {
                  _controller.searchAddresses();
                  //_controller.filterAddresses(query);
                },
              ),
            ),
          ],
        ),
      ),
    ),
  );
}