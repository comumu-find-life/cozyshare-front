
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:home_and_job/common-widgets/app-bar/CommonAppbar.dart';
import 'package:home_and_job/constants/Colors.dart';

class EditProfileView extends StatelessWidget {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(canBack: true, title: 'Edit Profile', color: kWhiteBackGroundColor,),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

          ],
        ),
      ),
    );
  }
}
