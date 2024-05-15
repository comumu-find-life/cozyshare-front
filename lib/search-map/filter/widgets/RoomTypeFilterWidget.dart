
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../constants/Colors.dart';
import '../../../constants/Fonts.dart';

class RoomTypeFilterWidget extends StatelessWidget {
  const RoomTypeFilterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 380.w,
      height: 140.h,
      color: kWhiteBackGroundColor,
      margin: EdgeInsets.only(top: 2.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(top: 30.h,left: 18.w),
            child: FBoldText("Room Type", kTextBlackColor, 14),
          ),
          Container(
            margin: EdgeInsets.only(top: 20.h,left: 15.w),
            child: Row(
              children: [
                Container(
                  width: 70.w,
                  height: 40.h,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      border: Border.all(color: kGrey400Color)
                  ),
                  child: Center(
                    child: FRegularText("Rent", kTextBlackColor, 14),
                  ),
                ),
                Container(
                  width: 70.w,
                  height: 40.h,
                  margin: EdgeInsets.only(left: 6.w),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      border: Border.all(color: kGrey400Color)
                  ),
                  child: Center(
                    child: FRegularText("Share", kTextBlackColor, 14),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
