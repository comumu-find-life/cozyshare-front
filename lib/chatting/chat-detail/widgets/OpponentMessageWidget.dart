import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_and_job/constants/Colors.dart';
import 'package:home_and_job/constants/Fonts.dart';

Widget OpponentMessageWidget(String message) {
  // 메시지의 길이에 따라 너비를 결정하기 위해 TextPainter를 사용하여 텍스트의 크기를 측정합니다.

  return Container(
    margin: EdgeInsets.only(top: 10.h, bottom: 10.h),
    child: Row(
      children: [
        _buildProfile(),
        Row(
          children: [

            _buildMessage(message),
            _buildDateTime(),
          ],
        )
      ],
    ),
  );
}

Widget _buildProfile(){
  return Container(
    width: 40.w,
    height: 40.h,
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      color: kGrey500Color
    ),
  );
}


Widget _buildMessage(String message){
  TextPainter textPainter = TextPainter(
    text: TextSpan(text: message),
    maxLines: 2,
    textDirection: TextDirection.rtl,
  )..layout();

  double containerWidth =
  textPainter.width + 20.0 > 200.w ? 200.w : textPainter.width + 20.0;

  return Container(
    width: containerWidth,
    decoration: BoxDecoration(
      color: kGrey100Color,
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(8.0),
        topRight: Radius.circular(8.0),
        bottomRight: Radius.circular(8)
      ),// 말풍선 모양을 위해 추가
    ),
    child: Padding(
      padding: const EdgeInsets.all(9.0),
      child: Flex(
        direction: Axis.horizontal,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Body2Text(message, kTextBlackColor),
          ),
        ],
      ),
    ),
  );
}

Widget _buildDateTime(){
  return Container(
    margin: EdgeInsets.only(left: 5.w),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.only(bottom: 1.w),
          child: HintText2("24.10.23", kGrey300Color),
        ),
        Container(

          child: HintText2("11:32", kGrey300Color),
        )
      ],
    ),
  );
}