import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:home_and_job/model/filter/Filter.dart';
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
            margin: EdgeInsets.only(top: 50.h),
            width: 350.w,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildTotalFilter(context),
                InkWell(
                  onTap: () async {
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
                    height: 43.h,
                    decoration: BoxDecoration(
                      color: kLightBlue,
                      borderRadius: BorderRadius.all(Radius.circular(6)),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [

                        _getxController.cityName == ""
                            ? Container(
                                margin: EdgeInsets.only(left: 15.w),
                                child:
                                    FRegularText("Search City", kDarkBlue, 15),
                              )
                            : Container(
                                margin: EdgeInsets.only(left: 15.w),
                                child: FRegularText(
                                    "${_getxController.cityName}",
                                    kGrey700Color,
                                    14),
                              ),

                        Container(
                          margin: EdgeInsets.only(right: 15.w),
                          child: Icon(
                            Icons.search,
                            color: kGrey800Color,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }

  Widget _buildTotalFilter(BuildContext context) {
    return InkWell(
      onTap: () async{

        Filter? filter = await Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SearchFilterView(_getxController.filter),

          ),
        );

        if(filter != null){
          _getxController.updateFilter(filter);

        }
        //Get.to(() => SearchFilterView(null), transition: Transition.upToDown);
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
