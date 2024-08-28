
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:home_and_job/constants/Colors.dart';
import 'package:home_and_job/constants/Fonts.dart';
import 'package:home_and_job/search/search-address/controller/SearchAddressController.dart';
import 'package:home_and_job/search/search-address/widgets/SearchAddressAppBar.dart';

class SearchAddressView extends StatefulWidget {
  @override
  State<SearchAddressView> createState() => _SearchAddressViewState();
}

class _SearchAddressViewState extends State<SearchAddressView> {
  SearchAddressController _controller = SearchAddressController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteBackGroundColor,
      appBar: SearchAddressAppBar(context, _controller),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Obx(() => Container(
                  color: kWhiteBackGroundColor,
                  height: 700.h,
                  width: 380.w,
                  margin: EdgeInsets.only(top: 20.h),
                  child: ListView.builder(
                    itemCount: _controller.filteredAddresses.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          _controller.selectCityItem(context, index);
                        },
                        child: Container(
                          height: 55.h,
                          child: Row(
                            children: [
                              Container(
                                margin: EdgeInsets.only(left: 10.w),
                                child: Icon(
                                  Icons.location_on,
                                  color: kDarkBlue,
                                  size: 26.sp,
                                ),
                              ),
                              Container(
                                  width: 300.w,
                                  margin: EdgeInsets.only(left: 20.w),
                                  child: Body2Text(
                                    _controller.filteredAddresses[index],
                                    kTextBlackColor,
                                  )),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
