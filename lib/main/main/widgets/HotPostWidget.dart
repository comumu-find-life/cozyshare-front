import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:home_and_job/constants/Colors.dart';
import 'package:home_and_job/constants/Fonts.dart';
import 'package:home_and_job/main/main/controller/MainController.dart';

import '../../../room/room-list/view/RoomListView.dart';

class HotPlaceWidget extends StatelessWidget {
  MainController controller;

  HotPlaceWidget(this.controller);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildText(),
        //  _buildSelectType(),
        _buildCityList(),
        //controller.selectHome? _buildHotHomePost() : _buildHotJobPost()
      ],
    );
  }

  Widget _buildCityList() {
    return Container(
      width: 360.w,
      height: 300.h,
      margin: EdgeInsets.only(top: 20.w, left: 20.w),
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          _buildSydney(),
          _buildMelbourne(),
          _buildBrisbane(),
          _buildAdelaide(),
          _buildGoldCoast(),
          _buildPerth(),
        ],
      ),
    );
  }

  Widget _buildSydney() {
    return InkWell(
      onTap: (){
        Get.to(() => RoomListView("Sydney NSW"));
      },
      child: Stack(
        children: [
          Container(
            width: 150.w,
            height: 240.h,
            margin: EdgeInsets.only(left: 10.w),
            child: Container(
              margin: EdgeInsets.only(right: 7.w),
              width: 120.w,
              height: 80.h,
              child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(8),
                    bottomLeft: Radius.circular(8),
                    topRight: Radius.circular(8),
                  ),
                  child: Image.asset(
                    "assets/images/cities/sydney.jpg",
                    fit: BoxFit.cover,
                  )),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 0.w),
            child: Stack(
              children: [
                Container(
                  width: 110.w,
                  child: Image.asset("assets/images/common/tag_normal.png"),
                ),
                Container(
                  margin: EdgeInsets.only(left: 22.w, bottom: 255.h),
                  child:
                      Center(child: Body1Text("Sydney", kWhiteBackGroundColor)),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildMelbourne() {
    return InkWell(
      onTap: (){
        Get.to(() => RoomListView("Melbourne VIC"));
      },
      child: Stack(
        children: [
          Container(
            width: 150.w,
            height: 240.h,
            margin: EdgeInsets.only(left: 10.w),
            child: Container(
              margin: EdgeInsets.only(right: 7.w),
              width: 120.w,
              height: 80.h,
              child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(8),
                    bottomLeft: Radius.circular(8),
                    topRight: Radius.circular(8),
                  ),
                  child: Image.asset(
                    "assets/images/cities/melbourne.jpg",
                    fit: BoxFit.cover,
                  )),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 0.w),
            child: Stack(
              children: [
                Container(
                  width: 110.w,
                  child: Image.asset("assets/images/common/tag_normal.png"),
                ),
                Container(
                  margin: EdgeInsets.only(left: 10.w, bottom: 255.h),
                  child:
                  Center(child: Body1Text("Melbourne", kWhiteBackGroundColor)),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildBrisbane() {
    return InkWell(
      onTap: (){
        Get.to(() => RoomListView("Brisbane QLD"));
      },
      child: Stack(
        children: [
          Container(
            width: 150.w,
            height: 240.h,
            margin: EdgeInsets.only(left: 10.w),
            child: Container(
              margin: EdgeInsets.only(right: 7.w),
              width: 120.w,
              height: 80.h,
              child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(8),
                    bottomLeft: Radius.circular(8),
                    topRight: Radius.circular(8),
                  ),
                  child: Image.asset(
                    "assets/images/cities/brisbane.jpg",
                    fit: BoxFit.cover,
                  )),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 0.w),
            child: Stack(
              children: [
                Container(
                  width: 110.w,
                  child: Image.asset("assets/images/common/tag_normal.png"),
                ),
                Container(
                  margin: EdgeInsets.only(left: 10.w, bottom: 255.h),
                  child:
                  Center(child: Body1Text("Brisbane", kWhiteBackGroundColor)),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildAdelaide() {
    return InkWell(
      onTap: (){
        Get.to(() => RoomListView("Adelaide SA"));
      },
      child: Stack(
        children: [
          Container(
            width: 150.w,
            height: 240.h,
            margin: EdgeInsets.only(left: 10.w),
            child: Container(
              margin: EdgeInsets.only(right: 7.w),
              width: 120.w,
              height: 80.h,
              child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(8),
                    bottomLeft: Radius.circular(8),
                    topRight: Radius.circular(8),
                  ),
                  child: Image.asset(
                    "assets/images/cities/brisbane.jpg",
                    fit: BoxFit.cover,
                  )),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 0.w),
            child: Stack(
              children: [
                Container(
                  width: 110.w,
                  child: Image.asset("assets/images/common/tag_normal.png"),
                ),
                Container(
                  margin: EdgeInsets.only(left: 10.w, bottom: 255.h),
                  child:
                  Center(child: Body1Text("Brisbane", kWhiteBackGroundColor)),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildGoldCoast() {
    return InkWell(
      onTap: (){
        Get.to(() => RoomListView("Gold Coast QLD"));
      },
      child: Stack(
        children: [
          Container(
            width: 150.w,
            height: 240.h,
            margin: EdgeInsets.only(left: 10.w),
            child: Container(
              margin: EdgeInsets.only(right: 7.w),
              width: 120.w,
              height: 80.h,
              child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(8),
                    bottomLeft: Radius.circular(8),
                    topRight: Radius.circular(8),
                  ),
                  child: Image.asset(
                    "assets/images/cities/brisbane.jpg",
                    fit: BoxFit.cover,
                  )),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 0.w),
            child: Stack(
              children: [
                Container(
                  width: 110.w,
                  child: Image.asset("assets/images/common/tag_normal.png"),
                ),
                Container(
                  margin: EdgeInsets.only(left: 10.w, bottom: 255.h),
                  child:
                  Center(child: Body1Text("Brisbane", kWhiteBackGroundColor)),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildPerth() {
    return InkWell(
      onTap: (){
        Get.to(() => RoomListView("Perth WA"));
      },
      child: Stack(
        children: [
          Container(
            width: 150.w,
            height: 240.h,
            margin: EdgeInsets.only(left: 10.w),
            child: Container(
              margin: EdgeInsets.only(right: 7.w),
              width: 120.w,
              height: 80.h,
              child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(8),
                    bottomLeft: Radius.circular(8),
                    topRight: Radius.circular(8),
                  ),
                  child: Image.asset(
                    "assets/images/cities/brisbane.jpg",
                    fit: BoxFit.cover,
                  )),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 0.w),
            child: Stack(
              children: [
                Container(
                  width: 110.w,
                  child: Image.asset("assets/images/common/tag_normal.png"),
                ),
                Container(
                  margin: EdgeInsets.only(left: 10.w, bottom: 255.h),
                  child:
                  Center(child: Body1Text("Brisbane", kWhiteBackGroundColor)),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildText() {
    return Container(
      margin: EdgeInsets.only(top: 30.h, left: 20.w,right: 20.w
      ),
      child: Row(
        children: [
          Container(
            child: FBoldText("Popular Cities", kTextBlackColor, 16),
          ),
          // Container(
          //   margin: EdgeInsets.only(left: 7.w),
          //   width: 50.w,
          //   height: 25.h,
          //   decoration: BoxDecoration(
          //       color: Colors.red,
          //       borderRadius: BorderRadius.only(
          //         topRight: Radius.circular(10),
          //         topLeft: Radius.circular(10),
          //         bottomRight: Radius.circular(10),
          //       ),
          //       border: Border.all(color: Colors.red)),
          //   child: Center(
          //     child: Body2Text("HOT", kWhiteBackGroundColor),
          //   ),
          // )
        ],
      ),
    );
  }
}
