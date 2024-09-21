import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:home_and_job/constants/Colors.dart';
import 'package:home_and_job/utils/DiskDatabase.dart';
import '../../../constants/Fonts.dart';
import '../../../procted-deal-guild/view/ProctedDealGuidView.dart';
import '../controller/MainController.dart';
import '../widgets/BannerWidget.dart';
import '../widgets/HotPostWidget.dart';
import '../widgets/MainAppBar.dart';
import '../widgets/PostHomeWidget.dart';
import '../widgets/SafeDealWidget.dart';
import '../widgets/SearchHomeWidget.dart';

class MainView extends StatelessWidget {
  const MainView({super.key});

  @override
  Widget build(BuildContext context) {
    MainController controller = MainController();
    return Scaffold(
      backgroundColor: kWhiteBackGroundColor,
      appBar: MainAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            //MainHeaderWidget(),
            Column(
              children: [
                SearchHomeWidget(controller),
                PostHomeWidget(controller),
                HotPlaceWidget(controller),
                SafeDealWidget(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
