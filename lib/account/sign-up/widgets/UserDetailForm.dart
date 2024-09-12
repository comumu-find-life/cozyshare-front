import 'dart:io';

import 'package:country_picker/country_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_and_job/constants/Colors.dart';
import 'package:image_picker/image_picker.dart';

import '../../../constants/Fonts.dart';
import '../controller/SignupController.dart';

class UserDetailForm extends StatefulWidget {
  SignupController _controller;

  UserDetailForm(this._controller);

  @override
  State<UserDetailForm> createState() => _UserDetailFormState();
}

class _UserDetailFormState extends State<UserDetailForm> {
  XFile? image_picked; // 이미지를 담을 변수 선언
  final ImagePicker picker = ImagePicker(); // ImagePicker 초기화
  String? _selectedGender;
  Country? _selectedCountry;

  // 이미지를 가져오는 함수
  Future getImage() async {
    // pickedFile에 ImagePicker로 가져온 이미지가 담긴다.
    final XFile? pickedFile =
        await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        image_picked = pickedFile;
      });
      widget._controller.selectImage(image_picked!.path);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 600.h,
      child: Column(
        children: [
          image_picked == null ? _buildNotSelectPhoto() : _buildSelectPhoto(),
          _buildJobForm(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildGenderForm(),
              _buildNationality(),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildNationality() {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 205.w,
            margin: EdgeInsets.only(top: 10.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 205.w,
                  margin: EdgeInsets.only(top: 5.h),
                  decoration: BoxDecoration(
                    border: Border.all(color: kGrey500Color),
                    borderRadius: BorderRadius.all(Radius.circular(6)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 15.h, left: 15.w),
                        child: FRegularText("Nationality", kGrey700Color, 13),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                            top: 3.h, left: 16.w, right: 16.w),
                        // 힌트 텍스트와 입력란 간의 간격 조정
                        child: InkWell(
                          onTap: () {
                            showCountryPicker(
                              countryListTheme: CountryListThemeData(
                                flagSize: 25,
                                backgroundColor: Colors.white,
                                textStyle: TextStyle(
                                    fontSize: 16, color: Colors.blueGrey),
                                bottomSheetHeight: 500,
                                // Optional. Country list modal height
                                // Optional. Sets the border radius for the bottomsheet.
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20.0),
                                  topRight: Radius.circular(20.0),
                                ),
                                // 텍스트 입력 스타일을 설정하여 검정색으로 변경
                                searchTextStyle: TextStyle(
                                    fontSize: 16, color: Colors.black),
                              ),
                              context: context,
                              showPhoneCode: false, // 전화 국가 코드는 숨김
                              onSelect: (Country country) {

                                setState(() {
                                  _selectedCountry = country;
                                  widget._controller.validatePrivacy();
                                });
                                widget._controller.selectCountry(country.toString());
                                widget._controller.validateUserDetail();
                              },
                            );
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: 8.h),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  width: 145.w,
                                  child: Text(
                                    _selectedCountry?.name ?? "Select Nationality",
                                    style: TextStyle(
                                      color: _selectedCountry == null
                                          ? kGrey300Color
                                          : Colors.black,
                                      fontSize: 14.sp,
                                    ),
                                  ),
                                ),
                                Icon(
                                  Icons.arrow_drop_down,
                                  color: kGrey700Color,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }


  Widget _buildGenderForm() {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 130.w,
            margin: EdgeInsets.only(top: 10.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    height: 80.h,
                    margin: EdgeInsets.only(top: 5.h),
                    decoration: BoxDecoration(
                      border: Border.all(color: kGrey500Color),
                      borderRadius: BorderRadius.all(Radius.circular(6)),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 15.h, left: 15.w),
                          child: FRegularText("Gender", kGrey700Color, 13),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 5.h, left: 16.w),
                          // 힌트 텍스트와 입력란 간의 간격 조정
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                              value: _selectedGender,
                              hint: Text(
                                "Select Gender",
                                style: TextStyle(
                                  color: kGrey300Color,
                                  fontSize: 12.sp,
                                ),
                              ),
                              items: <String>[
                                'Male',
                                'Female',
                                'AnyThing'
                              ].map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value,
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 14.sp)),
                                );
                              }).toList(),
                              onChanged: (String? newValue) {
                                widget._controller.selectGender(newValue!);
                                setState(() {
                                  _selectedGender = newValue;
                                });

                                widget._controller.validateUserDetail();
                              },
                              icon: Icon(
                                Icons.arrow_drop_down,
                                color: kGrey700Color,
                              ),
                              style: TextStyle(
                                  color: Colors.black, fontSize: 14.sp),
                              isDense: true, // 덴스한 디자인을 사용하여 높이를 줄임
                            ),
                          ),
                        ),
                      ],
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildJobForm() {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 335.w,
            margin: EdgeInsets.only(top: 10.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    width: 335.w,
                    height: 86.h,
                    margin: EdgeInsets.only(top: 5.h),
                    decoration: BoxDecoration(
                      border: Border.all(color: kGrey500Color),
                      borderRadius: BorderRadius.all(Radius.circular(6)),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 15.h, left: 15.w),
                          child: FRegularText("Your job", kGrey700Color, 13),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          // 힌트 텍스트와 입력란 간의 간격 조정
                          child: TextFormField(
                            onChanged: (text) {
                              widget._controller.validateUserDetail();
                            },
                            controller: widget._controller.jobController,
                            style: TextStyle(color: Colors.black),
                            // 텍스트 색상을 검정색으로 설정
                            textAlign: TextAlign.left,
                            // 텍스트를 왼쪽으로 정렬
                            cursorColor: kTextBlackColor,
                            decoration: InputDecoration(
                              hintText: "ex ) student",
                              hintStyle: TextStyle(
                                  color: kGrey300Color, fontSize: 12.sp),
                              border: InputBorder.none,
                              isDense: true, // 덴스한 디자인을 사용하여 높이를 줄임
                            ),
                          ),
                        ),
                      ],
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSelectPhoto() {
    return Center(
        child: Container(
      width: 100.w,
      height: 100.w,
      margin: EdgeInsets.only(left: 0.w, top: 20.h),
      child: Stack(
        children: [
          Container(
              width: 80.w,
              height: 80.w,
              margin: EdgeInsets.only(top: 10.h, left: 10.w),
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(50)),
                child: Image.file(
                  File(image_picked!.path),
                  fit: BoxFit.fitWidth,
                ),
              )),
          Positioned(
            top: 59.h,
            left: 63.w,
            child: Stack(
              children: [
                Container(
                  width: 38.w,
                  height: 38.h,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: kWhiteBackGroundColor),
                ),
                Positioned(
                  top: 9.h,
                  left: 9.w,
                  child: InkWell(
                    onTap: () {
                      getImage();
                    },
                    child: Container(
                      width: 19.w,
                      height: 19.h,
                      child: Container(
                          width: 19.w,
                          height: 19.h,
                          child: Icon(Icons.camera_alt)),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    ));
  }

  Widget _buildNotSelectPhoto() {
    return Center(
        child: Container(
      margin: EdgeInsets.only(left: 0.w, top: 20.h),
      child: Stack(
        children: [
          Container(
              width: 90.w,
              height: 90.w,
              decoration: BoxDecoration(
                border: Border.all(color: kGrey800Color),
                shape: BoxShape.circle,
              ),
              child: ClipRRect(

                borderRadius: BorderRadius.all(Radius.circular(50)),
                child: Image.asset("assets/images/common/user_icon.png",

                    width: 50.w, height: 50.h, fit: BoxFit.contain),
              )),
          Positioned(
            top: 69.h,
            left: 53.w,
            child: Stack(
              children: [
                Container(
                  width: 38.w,
                  height: 38.h,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: kGrey100Color),
                ),
                Positioned(
                  top: 9.h,
                  left: 9.w,
                  child: InkWell(
                    onTap: () {
                      getImage();
                    },
                    child: Container(
                        width: 19.w,
                        height: 19.h,
                        child: Icon(Icons.camera_alt)),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    ));
  }
}
