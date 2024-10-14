import 'package:flutter/material.dart';

import '../../../common-widgets/app-bar/CommonAppbar.dart';
import '../../../constants/Colors.dart';

class CashOutView extends StatelessWidget {
  const CashOutView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteBackGroundColor,
      appBar:
          CommonAppBar(canBack: true, title: "", color: kWhiteBackGroundColor),
      body: SingleChildScrollView(
        child: Column(
          children: [],
        ),
      ),
    );
  }
}
