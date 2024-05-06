
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:home_and_job/constants/Colors.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class HomeRegisterProcessBar extends StatelessWidget {
  double value;


  HomeRegisterProcessBar(this.value);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(15.0),
      child: new LinearPercentIndicator(
        width: MediaQuery.of(context).size.width - 50,
        animation: false,
        barRadius: Radius.circular(6),

        lineHeight: 20.0,
        animationDuration: 2500,
        percent: value,

        linearStrokeCap: LinearStrokeCap.roundAll,
        progressColor: kBlueColor,
      ),
    );
  }
}
