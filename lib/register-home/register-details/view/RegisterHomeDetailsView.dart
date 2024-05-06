import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:home_and_job/common-widgets/button/ButtonWidgets.dart';
import 'package:home_and_job/constants/Fonts.dart';
import 'package:home_and_job/register-home/widgets/HomeRegisterProcessBar.dart';
import '../../../model/home/enums/HomeOption.dart';
import '../../controller/RegisterHomeController.dart';

import '../../../../common-widgets/app-bar/CommonAppbar.dart';
import '../../../../constants/Colors.dart';
import '../../controller/RegisterHomeController.dart';
import '../../register-introduce/view/RegisterHomeIntroduceView.dart';

class RegisterHomeDetailsView extends StatelessWidget {
  RegisterHomeController _controller;

  RegisterHomeDetailsView(this._controller);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: _buildButton(),
      backgroundColor: kWhiteBackGroundColor,
      appBar: CommonAppBar(
        color: kWhiteBackGroundColor,
        title: "",
        canBack: true,
      ),
      body: SingleChildScrollView(
          child: Obx(() => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HomeRegisterProcessBar(0.6),
              Container(
                margin: EdgeInsets.only(top: 20.h, left: 20.w),
                child: Title3Text("Room Type", kTextBlackColor),
              ),
              buildInputHomeType(),
              Container(
                margin: EdgeInsets.only(top: 20.h, left: 20.w),
                child: Title3Text("Total BedRoom", kTextBlackColor),
              ),
              _buildInputBedRoomCount(),
              Container(
                margin: EdgeInsets.only(top: 20.h, left: 20.w),
                child: Title3Text("Total BathRoom", kTextBlackColor),
              ),
              _buildInputBathRoomCount(),
              Container(
                margin: EdgeInsets.only(top: 20.h, left: 20.w),
                child: Title3Text("Room Options", kTextBlackColor),
              ),
              Container(
                width: 360.w,
                height: 230.h,
                margin: EdgeInsets.only(left: 0.w, top: 20.h),
                child: GridView.builder(

                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio: MediaQuery.of(context).size.width /
                        (MediaQuery.of(context).size.height / 2.6.h),
                  ),
                  itemCount: HomeOptionType.values.length, // 아이템 수
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(), // 스크롤 비활성화
                  itemBuilder: (context, index) {
                    // 아이템 빌드
                    return _buildOptionItem(HomeOptionType.values[index]);
                  },
                ),
              ),
              Container(
                height: 150.h,
              )
            ],
          ))),
    );
  }

  Widget _buildButton() {
    return Container(
      margin: EdgeInsets.only(bottom: 15.h),
      child: Obx(() => _controller.isRegisterImage
          ? InkWell(
          onTap: () {
            Get.to(() => RegisterHomeIntroduceView(_controller));
          },
          child: NextButtonWidget("Next"))
          : NotYetButtonWidget("Next")),
    );
  }

  Widget buildInputHomeType() {
    return Container(
      margin: EdgeInsets.only(top: 30.h, left: 20.w),
      child: Row(
        children: [
          InkWell(
            onTap: () {
              _controller.selectHomeType(1);
            },
            child: _controller.isRentType
                ? Container(
              width: 80.w,
              height: 35.h,
              decoration: BoxDecoration(
                  color: kTextBlackColor,
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              child: Center(
                child: Body2Text("Rent", kWhiteBackGroundColor),
              ),
            )
                : Container(
              width: 80.w,
              height: 35.h,
              decoration: BoxDecoration(
                  border: Border.all(color: kGrey400Color),
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              child: Center(
                child: Body2Text("Rent", kGrey600Color),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              _controller.selectHomeType(2);
            },
            child: _controller.isShareRoomType
                ? Container(
              margin: EdgeInsets.only(left: 8.w),
              width: 80.w,
              height: 35.h,
              decoration: BoxDecoration(
                  color: kTextBlackColor,
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              child: Center(
                child: Body2Text("Share", kWhiteBackGroundColor),
              ),
            )
                : Container(
              margin: EdgeInsets.only(left: 8.w),
              width: 80.w,
              height: 35.h,
              decoration: BoxDecoration(
                  border: Border.all(color: kGrey400Color),
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              child: Center(
                child: Body2Text("Share", kGrey600Color),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildInputBedRoomCount() {
    return Row(
      children: [
        Container(
          margin: EdgeInsets.only(left: 20.w, top: 15.h),
          child: Icon(Icons.bed),
        ),
        Container(
          width: 280.w,
          height: 47.h,
          decoration: BoxDecoration(
              border: Border.all(color: kGrey200Color),
              borderRadius: BorderRadius.all(Radius.circular(6))),
          margin: EdgeInsets.only(top: 20.h, left: 9.w),
          child: TextFormField(
            onChanged: (text) {},
            controller: _controller.bedRoomCountController,
            style: TextStyle(color: Colors.black),
            // 텍스트 색상을 검정색으로 설정
            textAlign: TextAlign.left,

            // 텍스트를 왼쪽으로 정렬
            cursorColor: kTextBlackColor,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.only(left: 15.h, top: 6.h),
              hintText: "Count",
              hintStyle: TextStyle(
                  fontSize: 13.sp,
                  color: Colors.grey.shade500,
                  fontFamily: "hint"),
              border: InputBorder.none,
              isDense: true, // 덴스한 디자인을 사용하여 높이를 줄임
            ),
          ),
        ),
      ],
    );
  }

  //화장실 개수
  Widget _buildInputBathRoomCount() {
    return Row(
      children: [
        Container(
          margin: EdgeInsets.only(left: 20.w, top: 15.h),
          child: Icon(Icons.bathtub_rounded),
        ),
        Container(
          width: 280.w,
          height: 47.h,
          decoration: BoxDecoration(
              border: Border.all(color: kGrey200Color),
              borderRadius: BorderRadius.all(Radius.circular(6))),
          margin: EdgeInsets.only(top: 20.h, left: 9.w),
          child: TextFormField(
            onChanged: (text) {},
            controller: _controller.bathRoomCountController,
            style: TextStyle(color: Colors.black),
            // 텍스트 색상을 검정색으로 설정
            textAlign: TextAlign.left,

            // 텍스트를 왼쪽으로 정렬
            cursorColor: kTextBlackColor,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.only(left: 15.h, top: 6.h),
              hintText: "화장실 개수",
              hintStyle: TextStyle(
                  fontSize: 13.sp,
                  color: Colors.grey.shade500,
                  fontFamily: "hint"),
              border: InputBorder.none,
              isDense: true, // 덴스한 디자인을 사용하여 높이를 줄임
            ),
          ),
        ),
      ],
    );
  }

  //옵션 선택 아이템
  Widget _buildOptionItem(HomeOptionType type) {

    return Obx(() => InkWell(
      onTap: () {
        _controller.toggleOption(type);
      },
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.all(5),
            width: 70.w,
            height: 70.h, // 높이 조정
            decoration: BoxDecoration(
              border: Border.all(color: _controller.selectedOptions.contains(type) ? kBlueColor :kGrey300Color),
              borderRadius: BorderRadius.all(Radius.circular(30)),
              color:  Colors.transparent, // 선택된 아이템의 색상을 파란색으로 변경
            ),
            child: Container(
              margin: EdgeInsets.only(top: 5.h),
              child: Icon(
                type.icon,
                color: _controller.selectedOptions.contains(type) ? kBlueColor :kGrey700Color,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 5.h),
            child: FRegularText(type.text, _controller.selectedOptions.contains(type) ? kBlueColor :kGrey700Color, 13),
          )
        ],
      ),
    ));
  }

}
