import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:home_and_job/constants/Colors.dart';
import 'package:home_and_job/constants/Fonts.dart';
import 'package:multi_image_picker_plus/multi_image_picker_plus.dart';

import '../controller/RegisterHomeController.dart';

class RegisterHomeImageWidget extends StatelessWidget {
  RegisterHomeController _controller;

  RegisterHomeImageWidget(this._controller);

  @override
  Widget build(BuildContext context) {
    return Obx(() => Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
          onTap: (){
            print(_controller.images[0]);
          },
          child: Container(
            margin: EdgeInsets.only(top: 20.h, left: 30.w),
            child: Title3Text("최소 한장의 집 사진을 등록해주세요.", kTextBlackColor),
          ),
        ),
        _controller.images.length ==0? InkWell(
          onTap: () {

            _controller.registerImage();
          },
          child: Center(
            child: Container(
              margin: EdgeInsetsDirectional.only(top: 20.h),
              width: 320.w,
              height: 260.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(8)),
                border: Border.all(color: kGrey300Color),
              ),
              child: Icon(Icons.image),
            ),
          ),
        ): Center(
          child: Container(
            margin: EdgeInsetsDirectional.only(top: 20.h),
            width: 320.w,
            height: 300.h,
            child: PageView.builder(
              itemCount: _controller.images.length,
              itemBuilder: (context, index) {
                return AssetThumb(asset:_controller.images[index], width: 320, height: 260,);
              },
            ),
          ),
        )
      ],
    ));
  }
}
