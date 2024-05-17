

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_and_job/constants/Colors.dart';
import 'package:home_and_job/main/main/widgets/BannerWidget.dart';

import '../../../l10n/AppLocalizations.dart';
import '../controller/MainController.dart';
import '../widgets/HotPostWidget.dart';
import '../widgets/MainAppBar.dart';
import '../widgets/MainSearchBar.dart';
import '../widgets/PostHomeWidget.dart';
import '../widgets/SearchHomeWidget.dart';



class MainView extends StatelessWidget {
  const MainView({super.key});

  @override
  Widget build(BuildContext context) {
    MainController controller = MainController();
    return Scaffold(
      backgroundColor: kDarkBlue,
      //appBar: MainAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  width: 380.w,
                  height: 60.h,
                  color: kDarkBlue,
                ),
              ],
            ),
            Container(

              decoration: BoxDecoration(
                color: kWhiteBackGroundColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                )
              ),
              child: Column(
                children: [
                  SearchHomeWidget(controller),
                  PostHomeWidget(controller),
                  BannerWidget(controller),
                  HotPlaceWidget(controller)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
