import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_and_job/constants/Colors.dart';
import 'package:home_and_job/constants/Fonts.dart';
import 'package:home_and_job/my-profile/my-homes/edit-home/controller/HomeEditController.dart';

Widget HomeEditIntroduceViewWidget(HomeEditController _controller) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Container(
        margin: EdgeInsets.only(top: 40.h, left: 20.w),
        child: Title2Text("Introduce", kTextBlackColor),
      ),
      Container(
        width: 330.w,
        height: 400.h,
        decoration: BoxDecoration(
            border: Border.all(color: kGrey200Color),
            borderRadius: BorderRadius.all(Radius.circular(6))),
        margin: EdgeInsets.only(top: 20.h, left: 20.w, bottom: 10.h),
        child: TextFormField(
          onChanged: (text) {
          },
          controller: _controller.introduceController,
          style: TextStyle(color: Colors.black),
          // 텍스트 색상을 검정색으로 설정
          textAlign: TextAlign.left,

          // 텍스트를 왼쪽으로 정렬
          cursorColor: kTextBlackColor,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.only(left: 15.h, top: 6.h),
            hintText: "Input Content",
            hintStyle: TextStyle(
                fontSize: 13.sp,
                color: Colors.grey.shade500,
                fontFamily: "hint"),
            border: InputBorder.none,
            isDense: true, // 덴스한 디자인을 사용하여 높이를 줄임
          ),
        ),
      ),
    ],
  );
}

const String textt = """
Ideal for Employed Working Holiday Visa Holders
Close to Cairns CBD - 10 minute walk to Coles & Woolies; Cairns Base & Cairns Private Hospitals
5 minute walk to Domino's Pizza.
24-hour servo just around the corner for middle-of-the-night snacks.
Large kitchen with 2 X 4-burner cook-tops
multiple showers/toilets. Unisex as well as separate boys/girls
Coin-operated laundry.
Quiet: 10 pm Quiet-Zone Rule. No visitors allowed.
Lush tropical gardens. Large open spaces
Salt-water Swimming pool.
Large outdoor entertainment area with recliners
Free on-street parking. Off-street secure parking available for a small fee
Free Wi-fi in most areas. Some rooms may not receive signal.
Free Tea Coffee in Lounge room.
Minimum 4 weeks; Maximum *3 months; 1 week notice to leave.
* = extension after 3 months of stay is negotiable.
""";