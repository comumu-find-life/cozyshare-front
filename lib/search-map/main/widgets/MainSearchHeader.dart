

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:home_and_job/search-map/main/controller/MainSearchController.dart';

import '../../../constants/Colors.dart';
import '../../../constants/Fonts.dart';
import '../../../search/search-address/model/SearchCityModel.dart';
import '../../../search/search-address/view/SearchAddressView.dart';
import '../../filter/view/SearchFilterView.dart';

class MainSearchHeader extends StatelessWidget {
  MainSearchController _getxController;


  MainSearchHeader(this._getxController);


  @override
  Widget build(BuildContext context) {
    return Obx(() => Center(
      child: Container(
        margin: EdgeInsets.only(top: 30.h),
        width: 350.w,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildTotalFilter(),
            InkWell(
              onTap: ()async{
                SearchCityModel? selectedCity = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SearchAddressView(),
                  ),
                );
                if (selectedCity != null) {
                  _getxController.updateCity(selectedCity.cityName);
                  _getxController.updateCameraPosition(selectedCity.latLng);
                }
              },
              child: Container(
                width: 310.w,
                height: 45.h,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    border: Border.all(color: kGrey400Color)),
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 10.w),
                      child: Icon(
                        Icons.search,
                        color: kGrey800Color,
                      ),
                    ),
                    _getxController.cityName == ""?Container(
                      margin: EdgeInsets.only(left: 10.w),
                      child: FRegularText("Search City", kGrey500Color, 14),
                    ):Container(
                      margin: EdgeInsets.only(left: 10.w),
                      child: FRegularText("${_getxController.cityName}", kGrey700Color, 14),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }

  Widget _buildTotalFilter() {
    return InkWell(
      onTap: () {
        Get.to(() => SearchFilterView(), transition: Transition.upToDown);
      },
      child: Container(
        height: 35.h,
        width: 35.w,
        decoration: BoxDecoration(
            border: Border.all(color: kGrey400Color),
            borderRadius: BorderRadius.all(Radius.circular(6))),
        child: Center(
          child: Icon(
            Icons.tune,
            size: 19.sp,
            color: kDarkBlue,
          ),
        ),
      ),
    );
  }
}
