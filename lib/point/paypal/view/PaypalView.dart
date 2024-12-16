import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:home_and_job/common-widgets/app-bar/CommonAppbar.dart';
import 'package:home_and_job/constants/Colors.dart';
import 'package:http/http.dart' as http;
import 'package:webview_flutter/webview_flutter.dart';

import '../../../utils/DiskDatabase.dart';

class PayPalPaymentView extends StatefulWidget {
  int amount;


  PayPalPaymentView(this.amount);

  @override
  _PayPalPaymentState createState() => _PayPalPaymentState();
}

class _PayPalPaymentState extends State<PayPalPaymentView> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(canBack: true, title: "", color: kWhiteBackGroundColor),
      body: SingleChildScrollView(
        child: Column(
          children: [

          ],
        ),
      )
    );
  }
}
