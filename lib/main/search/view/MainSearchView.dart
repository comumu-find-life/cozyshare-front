
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:home_and_job/common-widgets/app-bar/CommonAppbar.dart';
import 'package:home_and_job/constants/Colors.dart';

class MainSearchView extends StatelessWidget {
  const MainSearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(canBack: true, title: '검색', color: kWhiteBackGroundColor),
    );
  }
}
