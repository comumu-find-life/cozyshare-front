import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../constants/Colors.dart';
import '../../../constants/Fonts.dart';

Widget EmptyContainer() {
  return Center(
    child: Container(
      margin: EdgeInsets.only(top: 20.h
      ),
      width: 350.w,
      height: 600.h,
      decoration: BoxDecoration(
          border: Border.all(color: kGrey300Color),
          borderRadius: BorderRadius.all(Radius.circular(7))),
      child: Center(
        child: FRegularText("Empty", kGrey300Color, 15),
      ),
    ),
  );
}