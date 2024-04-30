import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_and_job/constants/Colors.dart';
import 'package:home_and_job/constants/Fonts.dart';

import 'DealItemWidget.dart';

class DealHistoryWidget extends StatelessWidget {
  const DealHistoryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [


          Container(
              width: 380.w,
              height:415.h,
              margin: EdgeInsets.only(bottom: 0.h, top: 20.h),
              child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                  itemCount: 20,
                  itemBuilder: (BuildContext ctx, int idx) {
                    return DealItemWidget();
                  })),
        ],
      ),
    );
  }
}
