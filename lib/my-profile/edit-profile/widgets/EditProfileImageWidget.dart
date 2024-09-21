import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

import '../../../constants/Colors.dart';
import '../controller/EditProfileController.dart';

class EditProfileImageWidget extends StatefulWidget {
  EditProfileController _controller;

  EditProfileImageWidget(this._controller);

  @override
  State<EditProfileImageWidget> createState() => _EditProfileImageWidgetState();
}

class _EditProfileImageWidgetState extends State<EditProfileImageWidget> {
  XFile? image_picked; // 이미지를 담을 변수 선언
  final ImagePicker picker = ImagePicker(); // ImagePicker 초기화

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
      child: Column(
        children: [
          image_picked == null ? _buildNotSelectPhoto() : _buildSelectPhoto(),
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
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: kGrey400Color)),
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
                      border: Border.all(color: kGrey400Color),
                      shape: BoxShape.circle,
                      color: kWhiteBackGroundColor),
                ),
                Positioned(
                  top: 7.h,
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
              child: widget._controller.userProfileUrl != null
                  ? Text("이미지 있음", style: TextStyle(color: kTextBlackColor),)
                  : ClipRRect(
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
