import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../constants/Colors.dart';
import '../../../constants/Fonts.dart';

class HomeOptionsWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 240.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(top: 20.h, left: 20.w),
            child: Title2Text("Options", kTextBlackColor),
          ),
          Container(
            width: 360.w,
            height: 200.h,
            margin: EdgeInsets.only(left: 10.w, top: 20.h),
            child: GridView.builder(

              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: MediaQuery.of(context).size.width /
                    (MediaQuery.of(context).size.height / 4.h),
              ),
              itemCount: 6, // 아이템 수
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(), // 스크롤 비활성화
              itemBuilder: (context, index) {
                // 아이템 빌드
                return _buildOptionItem(index);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOptionItem(int index) {
    // 각 옵션에 대한 아이콘과 텍스트 설정
    List<Map<String, dynamic>> options = [
      {"icon": Icons.air_outlined, "text": "A/C"},
      {"icon": Icons.chair_outlined, "text": "Chair"},
      {"icon": Icons.desk, "text": "Desk"},
      {"icon": Icons.local_laundry_service, "text": "Washer"},
      {"icon": Icons.tv_outlined, "text": "TV"},
      {"icon": Icons.lightbulb_outline, "text": "Lamp"},
    ];

    return Container(
      margin: EdgeInsets.all(5),
      width: 100.w,
      height: 50.h, // 높이 조정
      decoration: BoxDecoration(
        border: Border.all(color: kGrey300Color),
        borderRadius: BorderRadius.all(Radius.circular(30)),
      ),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 5.h),
            child: Icon(
              options[index]["icon"],
              color: kGrey700Color,
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 5.h),
            child: FRegularText(options[index]["text"], kGrey700Color, 13),
          )
        ],
      ),
    );
  }
}
