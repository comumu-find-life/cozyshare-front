import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_paypal/flutter_paypal.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:home_and_job/model/point/request/PaymentRequest.dart';
import 'package:home_and_job/my-profile/my-homes/edit-home/detail-view/view/FinishView.dart';
import 'package:home_and_job/rest-api/point-api/PointApi.dart';
import 'package:home_and_job/utils/ApiUrls.dart';
import 'package:home_and_job/utils/SnackBar.dart';
import 'package:http/http.dart' as http;

import '../../../../my-profile/my-homes/edit-home/detail-view/view/FailedView.dart';

class PaymentService {
  static String PAYPAL_CLIENT_ID = dotenv.get("PAY_PAL_CLIENT_ID");
  static String PAYPAL_SECRET_KEY = dotenv.get("PAY_PAL_SECRET_KEY");
  bool resultState = false;

  void paypal(double amount, BuildContext context) async {
    String totalAmount = amount.toString();// Converting to string with 2 decimals
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (BuildContext context) => UsePaypal(
            sandboxMode: true,
            clientId: PAYPAL_CLIENT_ID,
            secretKey: PAYPAL_SECRET_KEY,
            returnURL: "http://localhost/success",
            cancelURL: "http://localhost/cancel",
            transactions: [
              {

                "amount": {
                  "total": totalAmount, // Using the dynamically calculated totalAmount in AUD
                  "currency": "AUD", // Set currency to AUD for Australian Dollars
                  "details": {
                    "subtotal": totalAmount, // Subtotal in AUD
                    "shipping": '0', // Example shipping cost (can be adjusted)
                    "shipping_discount": 0
                  }
                },
                "description": "The payment transaction description.",
                "item_list": {
                  "items": [
                    {
                      "name": "A demo product",
                      "quantity": 1,
                      "price": totalAmount, // Price is also based on the dynamic amount in AUD
                      "currency": "AUD" // Price is set to AUD
                    }
                  ],
                  "shipping_address": {
                    "recipient_name": "Jane Foster",
                    "line1": "Travis County",
                    "line2": "",
                    "city": "Austin",
                    "country_code": "AU", // Country code for Australia
                    "postal_code": "73301",
                    "phone": "+00000000",
                    "state": "Texas"
                  },
                }
              }
            ],
            note: "Contact us for any questions on your order.",
            onSuccess: (Map params) async {

              String paymentId = params['paymentId'] ?? '';
              String payerId = params['payerID'] ?? '';
              String token = params['token'] ?? '';

              PaymentRequest request = PaymentRequest(
                paymentId: paymentId,
                payerId: payerId,
                token: token,
                amount: amount,
              );

              print("request");
              print(request);

              var bool = await PointApi().chargePointByPaypal(request);

              if (bool) {
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  Get.to(() => FinishView("Charging Complete", "${amount} points have been recharged"));
                });
              }else{
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  Get.to(() => FailedView("Recharge Failed", "Please try recharging again."));
                });
              }
              print("bool2 " + bool.toString());
            },
            onError: (error) {
              print("onError: $error");
            },
            onCancel: (params) {
              print('cancelled: $params');
            }),
      ),
    );
  }
}
