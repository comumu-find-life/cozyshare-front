import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:home_and_job/constants/Colors.dart';
import 'package:home_and_job/home/main/controller/HomeMainController.dart';
import 'package:home_and_job/home/main/widgets/HomeAddFloatingButton.dart';
import 'package:home_and_job/home/main/widgets/HomeListWidget.dart';
import 'package:home_and_job/home/main/widgets/SelectHomeTypeWidget.dart';

import '../../../constants/Fonts.dart';
import '../widgets/HomeAppBar.dart';
import '../widgets/SearchBarWidget.dart';

class HomeMainView extends StatefulWidget {
  const HomeMainView({Key? key}) : super(key: key);

  @override
  _HomeMainView createState() => _HomeMainView();
}

class _HomeMainView extends State<HomeMainView> {
  HomeMainController _controller = HomeMainController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: OldGoalFloatingButton(),
      appBar: HomeAppBar(),

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SearchBarWidget(),
            SelectHomeTypeWidget(_controller),
            HomeListWidget(_controller)
          ],
        ),
      ),
    );
  }

}
