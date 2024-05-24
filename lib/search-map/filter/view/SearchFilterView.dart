
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_and_job/common-widgets/app-bar/CommonAppbar.dart';
import 'package:home_and_job/constants/Colors.dart';
import 'package:home_and_job/constants/Fonts.dart';
import 'package:home_and_job/model/filter/Filter.dart';
import 'package:home_and_job/search-map/filter/controller/FilterController.dart';
import 'package:home_and_job/search-map/filter/widgets/PriceFilterWidget.dart';
import 'package:home_and_job/search-map/filter/widgets/RoomTypeFilterWidget.dart';

class SearchFilterView extends StatelessWidget {

  Filter? filter;



  SearchFilterView(this.filter);

  @override
  Widget build(BuildContext context) {

    FilterController _controller = FilterController(filter);

    return Scaffold(
      appBar: _buildAppBar(context),
      //bottomSheet: _buildSearchButton(),
      backgroundColor: kWhiteBackGroundColor,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                RoomTypeFilterWidget(_controller),
                PriceFilterWidget(_controller),
              ],
            ),
            _buildSearchButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchButton(){
    return Container(
      width: 340.w,
      height: 45.h,
      margin: EdgeInsets.only(top: 210.h),
      decoration: BoxDecoration(
        color: kDarkBlue,
        borderRadius: BorderRadius.all(Radius.circular(5))
      ),
      child: Center(
        child: FBoldText("Search", kWhiteBackGroundColor, 15),
      ),
    );
  }

  AppBar _buildAppBar(BuildContext context){
    return AppBar(
      elevation: 0,
      centerTitle: true,
      backgroundColor: kWhiteBackGroundColor,
      automaticallyImplyLeading: false,
      title: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: (){
                Navigator.pop(context);
              },
              child: Container(
                child: Icon(Icons.close),
              ),
            ),
            Container(
              margin: EdgeInsets.only(right: 13.w),
              child: Title2Text("Filter", kGrey800Color),
            ),
            Container()
          ],
        ),
      )
    );
  }
}
