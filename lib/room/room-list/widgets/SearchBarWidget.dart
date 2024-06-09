import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:home_and_job/constants/Fonts.dart';
import 'package:home_and_job/search/search-address/model/SearchCityModel.dart';
import 'package:home_and_job/search/search-address/view/SearchAddressView.dart';

import '../../../constants/Colors.dart';
import '../controller/RoomListController.dart';

class SearchBarWidget extends StatelessWidget {
  RoomListController _controller;

  SearchBarWidget(this._controller);

  @override
  Widget build(BuildContext context) {
    return Obx(() => Container(
          margin: EdgeInsets.only(top: 10.h, bottom: 0.h),
          height: 40.h,
          width: 310.w,
          decoration: BoxDecoration(
            color: kLightBlue,
              borderRadius: BorderRadius.all(Radius.circular(6))),
          child: InkWell(
            onTap: () async {
// SearchAddressView에서 선택한 city를 받아옴
              SearchCityModel? selectedCity = await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SearchAddressView(),
                ),

              );
              if (selectedCity != null) {
                // 선택한 city를 상태 업데이트 메서드를 통해 업데이트
                _controller.updateCityName(selectedCity.cityName);
              }
              // Do something with the selected city
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _controller.cityName == ""
                    ? Container(
                        margin: EdgeInsets.only(left: 10.w),
                        child:
                            FRegularText("Search By City", kDarkBlue, 13),
                      )
                    : Container(

                        margin: EdgeInsets.only(left: 10.w),
                        child:
                        FBoldText("${_controller.cityName}", kTextBlackColor, 13),
                      ),
                Container(
                  margin: EdgeInsets.only(right: 10.w),
                  child: Icon(
                    Icons.search,
                    color: kGrey700Color,
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
