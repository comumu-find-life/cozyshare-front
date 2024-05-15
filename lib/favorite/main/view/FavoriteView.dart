

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_and_job/common-widgets/app-bar/CommonAppbar.dart';
import 'package:home_and_job/constants/Colors.dart';
import 'package:home_and_job/constants/Fonts.dart';
import 'package:home_and_job/favorite/main/controller/FavoriteController.dart';
import 'package:home_and_job/favorite/main/widgets/FavoritePostWidget.dart';
import 'package:home_and_job/favorite/main/widgets/SelectFavoriteType.dart';

class FavoriteView extends StatelessWidget {
  const FavoriteView({super.key});

  @override
  Widget build(BuildContext context) {
    FavoriteController _controller = FavoriteController();

    return Scaffold(
      backgroundColor: kWhiteBackGroundColor,
      appBar: _buildAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            FavoritePostWidget(_controller)

          ],
        ),
      ),
    );

  }

  AppBar _buildAppBar(){
    return AppBar(
      backgroundColor: kWhiteBackGroundColor,
      toolbarHeight: 50.h,
      automaticallyImplyLeading: false,
      elevation: 0,
      title: Row(
        children: [
          Container(
            margin: EdgeInsets.only(top: 10.h,left: 10.w),
            child: Title2Text("Shortlist", kTextBlackColor),
          )
        ],
      ),
    );
  }
}
