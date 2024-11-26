import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_and_job/constants/Fonts.dart';

import '../../../../constants/Colors.dart';
import '../controller/DealGeneratorController.dart';

class ProviderAccountFormWidget extends StatelessWidget {
  DealGeneratorController _controller;


  ProviderAccountFormWidget(this._controller);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildBondText(),
        _buildBond(),
        // _buildMainText(),
        // _buildInputName(),
        // _buildBankName(),
        // _buildAccount()
      ],
    );
  }

  Widget _buildBond() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: Container(
            width: 335.w,
            margin: EdgeInsets.only(top: 25.h,left: 10.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: HintText3("Deposit (\$)", kGrey600Color),
                ),
                Container(
                  width: 320.w,
                  height: 45.h,

                  margin: EdgeInsets.only(top: 5.h),
                  decoration: BoxDecoration(
                    //color: kGrey300Color,
                    border: Border(
                      bottom: BorderSide(width: 1, color: kGrey200Color),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 0),
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      controller: _controller.bondController,
                      style: TextStyle(color: Colors.black, fontSize: 14.sp),
                      textAlign: TextAlign.left,
                      onChanged: (text) {
                        // 현재 텍스트필드의 텍스트를 출력
                        _controller.updateAccountController();
                      },
                      cursorColor: kTextBlackColor,
                      decoration: InputDecoration(
                        hintText: "price",
                        hintStyle: TextStyle(color: kGrey300Color),
                        // labelText: controller.text.isEmpty ? "이름" : "이름",
                        //labelStyle: TextStyle(color: Colors.black.withOpacity(0.8), fontSize: 13.sp, fontWeight: FontWeight.bold),
                        border: InputBorder.none,
                        isDense: true,
                        contentPadding: EdgeInsets.fromLTRB(0, 7, 0, -10),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }


  Widget _buildBondText() {
    return Container(
      margin: EdgeInsets.only(top: 30.h, left: 20.w),
      child: Row(
        children: [
          Container(
            child: Title2Text("Contract amount", kTextBlackColor),
          ),
          InkWell(
            onTap: () {},
            child: Container(
              margin: EdgeInsets.only(left: 5.w),
              child: Icon(
                Icons.report,
                color: kDarkBlue,
                size: 18.sp,
              ),
            ),
          )
        ],
      ),
    );
  }

}
