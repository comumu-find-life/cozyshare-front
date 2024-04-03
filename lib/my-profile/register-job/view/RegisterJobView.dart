
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:home_and_job/common-widgets/app-bar/CommonAppbar.dart';
import 'package:home_and_job/constants/Colors.dart';
import 'package:home_and_job/my-profile/register-job/controller/RegisterJobController.dart';


class RegisterJovView extends StatelessWidget {
  const RegisterJovView({super.key});

  @override
  Widget build(BuildContext context) {
    RegisterJobController _controller = RegisterJobController();
    return Scaffold(
      appBar: CommonAppBar(canBack: true, title: '', color: kWhiteBackGroundColor,),

      body: SingleChildScrollView(
        child: Column(
          children: [


          ],
        ),
      ),
    );
  }
}
