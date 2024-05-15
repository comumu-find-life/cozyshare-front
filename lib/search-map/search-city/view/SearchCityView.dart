import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_and_job/common-widgets/app-bar/CommonAppbar.dart';
import 'package:home_and_job/constants/Colors.dart';

import '../../../constants/Fonts.dart';
import '../widgets/SearchCityAppBar.dart';

class SearchCityView extends StatefulWidget {
  const SearchCityView({super.key});

  @override
  State<SearchCityView> createState() => _SearchCityViewState();
}

class _SearchCityViewState extends State<SearchCityView> {
  TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kGrey100Color,
      appBar: SearchCityAppBar(context, _searchController),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Container(
                margin: EdgeInsets.only(top: 300.h),
                child: FRegularText("Not Find City", kTextBlackColor, 16),
              ),
            )
          ],
        ),
      ),
    );
  }


}
