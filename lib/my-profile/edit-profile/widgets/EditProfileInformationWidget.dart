
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../constants/Colors.dart';
import '../../../constants/Fonts.dart';
import '../controller/EditProfileController.dart';

class EditProfileInformationWidget extends StatefulWidget {

  EditProfileController _controller;


  EditProfileInformationWidget(this._controller);

  @override
  State<EditProfileInformationWidget> createState() => _EditProfileInformationWidgetState();
}

class _EditProfileInformationWidgetState extends State<EditProfileInformationWidget> {
  String? _selectedGender;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildNickNameForm(),
        _buildJobForm(),
        _buildIntroduceForm(),

      ],
    );
  }

  Widget _buildGenderForm() {
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
                            },
                            controller: widget._controller.jobController,
                            style: TextStyle(color: Colors.black),
                            // 텍스트 색상을 검정색으로 설정
                            textAlign: TextAlign.left,
                            // 텍스트를 왼쪽으로 정렬
                            cursorColor: kTextBlackColor,
                            decoration: InputDecoration(
                              hintText: "student",
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

  Widget _buildNickNameForm() {
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
                          child: FRegularText("Nickname", kGrey700Color, 13),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          // 힌트 텍스트와 입력란 간의 간격 조정
                          child: TextFormField(
                            onChanged: (text) {
                            },
                            controller: widget._controller.nicknameController,
                            style: TextStyle(color: Colors.black),
                            // 텍스트 색상을 검정색으로 설정
                            textAlign: TextAlign.left,
                            // 텍스트를 왼쪽으로 정렬
                            cursorColor: kTextBlackColor,
                            decoration: InputDecoration(
                              hintText: "nickname",
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

  Widget _buildIntroduceForm() {
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
                    height: 186.h,
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
                          child: FRegularText("Introduce Myself", kGrey700Color, 13),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          // 힌트 텍스트와 입력란 간의 간격 조정
                          child: TextFormField(
                            onChanged: (text) {
                            },
                            controller: widget._controller.nicknameController,
                            style: TextStyle(color: Colors.black),
                            // 텍스트 색상을 검정색으로 설정
                            textAlign: TextAlign.left,
                            // 텍스트를 왼쪽으로 정렬
                            cursorColor: kTextBlackColor,
                            decoration: InputDecoration(
                              hintText: "Introduce myself",
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
}
