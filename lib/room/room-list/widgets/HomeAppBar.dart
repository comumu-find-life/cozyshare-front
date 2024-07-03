import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/default_transitions.dart';

import '../../../constants/Colors.dart';
import '../../../constants/Fonts.dart';
import '../../../model/filter/Filter.dart';
import '../../../search-map/filter/view/SearchFilterView.dart';
import '../controller/RoomListController.dart';
import 'SearchBarWidget.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  RoomListController _controller;

  HomeAppBar(this._controller);

  @override
  Size get preferredSize => Size.fromHeight(65.h);

  @override
  Widget build(BuildContext context) {
    return AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: kWhiteBackGroundColor,
        automaticallyImplyLeading: false,
        title: Container(
          width: 360.w,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  margin: EdgeInsets.only(top: 5.h),
                  child: Icon(
                    Icons.arrow_back_ios,
                    size: 17.sp,
                  ),
                ),
              ),
              SearchBarWidget(_controller),
              _buildTotalFilter(context)
            ],
          ),
        ));
  }

  Widget _buildTotalFilter(BuildContext context) {
    return InkWell(
      onTap: () async {
        Filter? filter = await Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SearchFilterView(
                _controller.saveFilter.value == null
                    ? null
                    : _controller.saveFilter.value),
          ),
        );

        if (filter != null) {
          _controller.updateFilter(filter);
        }

      },
      child: Container(
        height: 37.h,
        width: 37.w,
        margin: EdgeInsets.only(top: 10.h),
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
