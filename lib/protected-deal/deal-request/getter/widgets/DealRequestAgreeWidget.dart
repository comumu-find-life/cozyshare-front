
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:home_and_job/constants/Colors.dart';
import 'package:home_and_job/constants/Fonts.dart';

import '../controller/DealRequestControllerByGetter.dart';

class DealRequestAgreeWidget extends StatelessWidget {
  final DealRequestControllerByGetter controller;

  const DealRequestAgreeWidget({Key? key, required this.controller})
      : super(key: key);

  get wGrey700Color => null;

  Color? get wWhiteColor => null;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20.5.h,left: 20.w),
      width: 335.w,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child: Row(
              children: [
                Obx(() => Container(
                  width: 24.w,
                  height: 23.h,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(6))
                  ),
                  child: Checkbox(
                      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(3.5))),
                      activeColor: kTextBlackColor,
                      fillColor: const MaterialStatePropertyAll(kWhiteBackGroundColor),
                      checkColor: kTextBlackColor,
                      visualDensity: VisualDensity.comfortable,
                      side: MaterialStateBorderSide.resolveWith(
                            (Set<MaterialState> states) {
                          if (states.contains(MaterialState.selected)) {
                            return const BorderSide(color: kGrey700Color, width: 2,);
                          }
                          return const BorderSide(color: kGrey700Color, width: 2);
                        },
                      ),
                      value: controller.canNext,
                      onChanged: (bool? newValue) {
                        controller.checkAgree(newValue);
                      }),
                )
                ),
                Container(
                    margin: EdgeInsets.only(left: 8.w),
                    child: FRegularText("Agree to the Terms and Conditions", kGrey700Color,14)
                ),
              ],
            ),
          ),
          Container()
        ],
      ),
    );
  }
}