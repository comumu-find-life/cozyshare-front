
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../constants/Colors.dart';
import '../../../constants/Fonts.dart';

Widget MyMessageWidget(String message){
  return Container(
    margin: EdgeInsets.only(top: 10.h, right: 13.w, bottom: 10.h),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        _buildDateTime(),
        _buildMessage(message),
    
      ],
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
  textPainter.width + 20.0 > 300.w ? 300.w : textPainter.width + 20.0;

  return Container(
    width: containerWidth,
    decoration: BoxDecoration(
      color: kLightBlue,
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(8.0),
          topRight: Radius.circular(8.0),
          bottomLeft: Radius.circular(8)
      ),// 말풍선 모양을 위해 추가
    ),
    child: Padding(
      padding: const EdgeInsets.all(12.0),
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
    margin: EdgeInsets.only(right: 5.w),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.end,
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