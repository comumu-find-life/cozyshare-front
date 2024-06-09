import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_and_job/common-widgets/app-bar/CommonAppbar.dart';
import 'package:home_and_job/constants/Colors.dart';
import 'package:home_and_job/constants/Fonts.dart';
import 'package:home_and_job/favorite/main/controller/FavoriteController.dart';
import 'package:home_and_job/favorite/main/widgets/EmptyFavoriteWidget.dart';
import 'package:home_and_job/favorite/main/widgets/FavoritePostWidget.dart';
import 'package:home_and_job/favorite/main/widgets/SelectFavoriteType.dart';

class FavoriteView extends StatefulWidget {
  const FavoriteView({super.key});

  @override
  State<FavoriteView> createState() => _FavoriteViewState();
}

class _FavoriteViewState extends State<FavoriteView> {
  @override
  Widget build(BuildContext context) {
    FavoriteController _controller = FavoriteController();

    Future<void> _refreshFavorites() async {
      setState(() {});
    }

    return Scaffold(
        backgroundColor: kWhiteBackGroundColor,
        appBar: _buildAppBar(),
        body: FutureBuilder(
          future: _controller.loadFavoriteHomes(),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              return Container();
            } else {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    _controller.homes.length == 0
                        ? EmptyFavoruteWidget()
                        : Container(
                            margin: EdgeInsets.only(bottom: 10.h),
                            width: 380.w,
                            child: Column(
                              children: _controller.homes.map((home) {
                                return FavoritePostWidget(home);
                              }).toList(),
                            ),
                          )
                  ],
                ),
              );
            }
          },
        ));
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: kWhiteBackGroundColor,
      toolbarHeight: 50.h,
      automaticallyImplyLeading: false,
      elevation: 0,
      title: Row(
        children: [
          Container(
            margin: EdgeInsets.only(top: 15.h, left: 10.w),
            child: FBoldText("Shortlist", kTextBlackColor, 15),
          )
        ],
      ),
    );
  }
}
