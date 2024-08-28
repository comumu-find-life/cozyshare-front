
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../common-widgets/app-bar/CommonAppbar.dart';
import '../../../constants/Colors.dart';

class PoliciesView extends StatelessWidget {
  const PoliciesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteBackGroundColor,
      appBar: CommonAppBar(canBack: true, title: '', color: kWhiteBackGroundColor,),
      body: SingleChildScrollView(
        child: Column(),
      ),
    );
  }
}
