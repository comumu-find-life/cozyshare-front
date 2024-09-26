
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_and_job/common-widgets/app-bar/CommonAppbar.dart';
import 'package:home_and_job/constants/Colors.dart';

import '../widgets/MyPointHeader.dart';
import '../controller/MyPointController.dart';
import '../widgets/MyPointHistory.dart';

class MyPointView extends StatelessWidget {
  const MyPointView({super.key});

  @override
  Widget build(BuildContext context) {
    MyPointController _controller = MyPointController();
    return Scaffold(
      backgroundColor: kWhiteBackGroundColor,
      appBar: CommonAppBar(canBack: true, title: '', color: kWhiteBackGroundColor,),
      body: SingleChildScrollView(
        child: Column(
            children: [
              MyPointHeader(_controller),
              MyPointHistory(_controller),
            ],

        ),
      ),
    );
  }

}
