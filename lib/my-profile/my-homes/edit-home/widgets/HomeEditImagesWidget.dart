import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_and_job/constants/Colors.dart';
import 'package:home_and_job/constants/Fonts.dart';
import 'package:home_and_job/my-profile/my-homes/edit-home/controller/HomeEditController.dart';

class HomeEditImagesWidget extends StatefulWidget {
  HomeEditController _controller;


  HomeEditImagesWidget(this._controller);

  @override
  _HomeEditImagesWidgetState createState() => _HomeEditImagesWidgetState();
}

class _HomeEditImagesWidgetState extends State<HomeEditImagesWidget> {


  final List<String> imagePaths = [
    "assets/images/test/home.png",
    "assets/images/test/home.png",
    "assets/images/test/home.png",
  ];



  @override
  Widget build(BuildContext context) {
    return Container(
      width: 380.w,
      height: 100.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: imagePaths.length + 1, // Include the camera widget
        itemBuilder: (context, index) {
          if (index == 0) {
            return _buildCamera(); // The first item is the camera widget
          } else {
            return _buildImage(imagePaths[index - 1]); // The rest are images
          }
        },
      ),
    );
  }

  Widget _buildCamera() {
    return Container(
      margin: EdgeInsets.only(right: 5.w, left: 10.w, top: 10.h),
      width: 80.w,
      height: 90.h,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(7)),
          border: Border.all(color: kGrey400Color)),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 20.h, bottom: 8.h),
            child: Icon(
              Icons.camera_alt,
              color: kGrey600Color,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Body2Text("7", kPrimaryColor),
              Body2Text("/10", kGrey600Color),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildImage(String imagePath) {
    return Container(
      width: 110.w,
      height: 100.h,
      child: Stack(
        children: [
          Positioned(
            top: 10.h,
            child: Container(
              width: 100.w,
              height: 90.h,
              decoration: BoxDecoration(
                border: Border.all(color: kPrimaryColor),
                borderRadius: BorderRadius.all(Radius.circular(7)),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(7),
                child: Image.asset(
                  imagePath,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Positioned(
            top: 0.h,
            left: 5.w,
            child: Container(
              margin: EdgeInsets.only(left: 80.w, top: 0.h),
              width: 28.w,
              height: 28.h,
              decoration: BoxDecoration(
                  shape: BoxShape.circle, color: kWhiteBackGroundColor),
              child: Center(
                child: Icon(Icons.cancel),
              ),
            ),
          )
        ],
      ),
    );
  }
}
