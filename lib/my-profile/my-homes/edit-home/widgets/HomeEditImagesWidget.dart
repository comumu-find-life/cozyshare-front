import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
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
  @override
  Widget build(BuildContext context) {
    return Obx(() => Row(
          children: [
            // InkWell(
            //   onTap: () {
            //     widget._controller.test();
            //   },
            //   child: Container(
            //     child: Body2Text("asd", kTextBlackColor),
            //   ),
            // ),
            _buildCamera(),
            Container(
              width: 260.w,
              height: 100.h,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: widget._controller.homeImages.length,
                // Include the camera widget
                itemBuilder: (context, index) {
                  return _buildImage(widget
                      ._controller.homeImages[index]); // The rest are images
                },
              ),
            ),
          ],
        ));
  }

  Widget _buildCamera() {
    return InkWell(
      onTap: () {
        widget._controller.addHomeImages();
      },
      child: Container(
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
                Body2Text(
                    "${widget._controller.homeImages.length}", kPrimaryColor),
                Body2Text("/10", kGrey600Color),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _buildImage(String imagePath) {
    return Container(
      width: 110.w,
      height: 100.h,
      child: Stack(
        // Stack 위젯을 추가하여 Positioned 위젯이 올바르게 배치되도록 합니다.
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
                child: imagePath.startsWith("/")
                    ? Image.file(
                        File(imagePath),
                        width: 320.w,
                        height: 260.h,
                  fit: BoxFit.fitWidth,
                      )
                    : Image.asset(
                        "assets/images/test/home.png",
                        //imagePath,
                        fit: BoxFit.cover,
                      ),
              ),
            ),
          ),
          Positioned(
            top: 0.h,
            left: 5.w,
            child: InkWell(
              // InkWell 위젯을 Positioned 위젯 내부로 이동시킵니다.
              onTap: () {
                widget._controller.deleteHomeImages(imagePath);
              },
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
            ),
          )
        ],
      ),
    );
  }

// Widget _buildXFileImage(String imagePath) {
//   return Container(
//     width: 110.w,
//     height: 100.h,
//     child: Stack(
//       children: [
//         Positioned(
//           top: 10.h,
//           child: Container(
//             width: 100.w,
//             height: 90.h,
//             decoration: BoxDecoration(
//               border: Border.all(color: kPrimaryColor),
//               borderRadius: BorderRadius.all(Radius.circular(7)),
//             ),
//             child: ClipRRect(
//                 borderRadius: BorderRadius.circular(7),
//                 child: Image.file(
//                   File(imagePath),
//                   width: 320.w,
//                   height: 260.h,
//                 )
//             ),
//           ),
//         ),
//         InkWell(
//           onTap: () {
//             widget._controller.deleteHomeImages(imagePath);
//           },
//           child: Positioned(
//             top: 0.h,
//             left: 5.w,
//             child: Container(
//               margin: EdgeInsets.only(left: 80.w, top: 0.h),
//               width: 28.w,
//               height: 28.h,
//               decoration: BoxDecoration(
//                   shape: BoxShape.circle, color: kWhiteBackGroundColor),
//               child: Center(
//                 child: Icon(Icons.cancel),
//               ),
//             ),
//           ),
//         )
//       ],
//     ),
//   );
// }
}
