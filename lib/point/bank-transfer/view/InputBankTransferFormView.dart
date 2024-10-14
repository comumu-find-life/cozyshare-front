import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../common-widgets/app-bar/CommonAppbar.dart';
import '../../../constants/Colors.dart';
import '../../../constants/Fonts.dart';
import '../controller/BankTransferController.dart';

class InputBankTransferFormView extends StatelessWidget {
  BankTransferController _controller = BankTransferController();
  int point;

  InputBankTransferFormView(this.point);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          CommonAppBar(canBack: true, title: "", color: kWhiteBackGroundColor),
      backgroundColor: kWhiteBackGroundColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildNameForm(),
          ],
        ),
      ),
    );
  }

  Widget _buildNameForm() {
    return Center(
      child: Container(
        width: 335.w,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(top: 20.h),
              child: FBoldText("Depositor Name", kTextBlackColor, 14),
            ),
            Container(
              width: 335.w,
              height: 56.h,
              margin: EdgeInsets.only(top: 15.h),
              decoration: BoxDecoration(
                border: Border.all(color: kGrey300Color),
                color: kWhiteBackGroundColor,
                borderRadius: BorderRadius.all(Radius.circular(5)),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                // 힌트 텍스트와 입력란 간의 간격 조정
                child: TextFormField(
                  controller: _controller.nameController,
                  style: TextStyle(color: Colors.black),
                  // 텍스트 색상을 검정색으로 설정
                  textAlign: TextAlign.center,
                  // 텍스트를 왼쪽으로 정렬
                  cursorColor: kTextBlackColor,
                  decoration: InputDecoration(
                    hintText: "",
                    hintStyle: TextStyle(color: kGrey700Color, fontSize: 14.sp),
                    border: InputBorder.none,
                    isDense: true, // 덴스한 디자인을 사용하여 높이를 줄임
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
