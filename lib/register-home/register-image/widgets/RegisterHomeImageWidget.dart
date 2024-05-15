import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:home_and_job/constants/Colors.dart';
import 'package:home_and_job/constants/Fonts.dart';
import 'package:multi_image_picker_plus/multi_image_picker_plus.dart';

import '../controller/RegisterImageController.dart';

class RegisterHomeImageWidget extends StatelessWidget {
  HomeImageController _controller;

  RegisterHomeImageWidget(this._controller);

  @override
  Widget build(BuildContext context) {
    return Obx(() => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
              onTap: () {
                print(_controller.images[0]);
              },
              child: Container(
                margin: EdgeInsets.only(top: 20.h, left: 30.w),
                child: Title3Text("Input Room Images", kTextBlackColor),
              ),
            ),
            _controller.images.length == 0
                ? InkWell(
                    onTap: () {
                      _controller.registerImage();
                    },
                    child: Center(
                      child: Container(
                          margin: EdgeInsetsDirectional.only(top: 20.h),
                          width: 320.w,
                          height: 260.h,
                          decoration: BoxDecoration(
                            color: kGrey100Color,
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                            border: Border.all(color: kGrey300Color),
                          ),
                          child: Container(
                            margin: EdgeInsets.only(left: 20.w),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  margin: EdgeInsets.only(top: 40.h),
                                  child: FBoldText(
                                      "Add Room Photos", kGrey700Color, 16),
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 10.h),
                                  child: FRegularText(
                                      "Please add at least one picture",
                                      kGrey700Color,
                                      14),
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 40.h),
                                  width: 270.w,
                                  height: 45.h,
                                  decoration: BoxDecoration(
                                      color: kWhiteBackGroundColor,
                                      border: Border.all(
                                        color: kGrey300Color,
                                      ),
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(6))),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                          margin: EdgeInsets.only(right: 5.w),
                                          child: Icon(Icons.image)),
                                      Container(
                                        margin: EdgeInsets.only(right: 5.w),
                                        child: FRegularText(
                                            "Add Photos", kGrey700Color, 14),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          )),
                    ),
                  )
                : Center(
                    child: Container(
                      margin: EdgeInsetsDirectional.only(top: 20.h),
                      width: 320.w,
                      height: 300.h,
                      decoration: BoxDecoration(
                          border: Border.all(color: kGrey300Color),
                          borderRadius: BorderRadius.all(Radius.circular(6))),
                      child: PageView.builder(
                        itemCount: _controller.images.length,
                        itemBuilder: (context, index) {
                          return AssetThumb(

                            asset: _controller.images[index],
                            width: 320,
                            height: 260,
                          );
                        },
                      ),
                    ),
                  )
          ],
        ));
  }
}
