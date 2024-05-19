import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:home_and_job/constants/Colors.dart';
import 'package:home_and_job/constants/Fonts.dart';
import 'package:home_and_job/search-map/main/widgets/MainSearchHeader.dart';
import 'package:home_and_job/search-map/search-list/view/SearchListByMapView.dart';
import '../controller/MainSearchController.dart';

class MainSearchView extends StatefulWidget {
  const MainSearchView({super.key});

  @override
  State<MainSearchView> createState() => _MainSearchViewState();
}

class _MainSearchViewState extends State<MainSearchView> {
  MainSearchController _getxController = MainSearchController();

  @override
  void initState() {
    _getxController.initSet();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteBackGroundColor,
      bottomSheet: _buildBottomButton(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            MainSearchHeader(_getxController),
            Obx(() => Container(
                margin: EdgeInsets.only(top: 20.h),
                width: 380.w,
                height: 570.h,
                child: GoogleMap(
                    mapType: MapType.normal,
                    initialCameraPosition: _getxController.parisCameraPosition,
                    markers: _getxController.markers,
                    onMapCreated: (GoogleMapController controller) {
                      _getxController.controller.complete(controller);
                      _getxController.manager.setMapId(controller.mapId);
                    },
                    onCameraMove: _getxController.manager.onCameraMove,
                    onCameraIdle: _getxController.manager.updateMap)))
          ],
        ),
      ),
    );
  }


  Widget _buildBottomButton() {
    return Obx(() => InkWell(
      onTap: () {
        Get.to(() => SearchRoomListByMapView(_getxController.filterHomes));
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 10.h),
        width: 360.w,
        height: 45.h,

        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(6)),
            color: kDarkBlue),
        child: Center(
          child: FBoldText("See  ${_getxController.filterHomes.length} Rooms in the Area",
              kWhiteBackGroundColor, 14),
        ),
      ),
    ));
  }


}