import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:home_and_job/model/user/response/UserAccountResponse.dart';
import 'package:home_and_job/point/charge-point/main/controller/PaymentService.dart';
import 'package:home_and_job/utils/SnackBar.dart';

import 'dart:async';

import '../../../../my-profile/my-homes/edit-home/detail-view/view/FinishView.dart';



class ChargePointController extends GetxController {
  RxInt paymentMethod = 0.obs;
  RxString amount = ''.obs; // Make the amount reactive
  late UserAccountResponse userAccountResponse;
  TextEditingController amountController = TextEditingController();


  @override
  void onInit() {
    super.onInit();
    // Listen to changes in the amountController and update the reactive variable
    amountController.addListener(() {
      amount.value = amountController.text;
    });
  }

  void setInitAmount(double? initAmount){
    if(initAmount != null){
      amountController.text = initAmount.toString();
      amount.value = initAmount.toString();
    }
  }

  // amount 업데이트 메서드
  void updateAmount(String newAmount) {
    amount.value = newAmount;
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<bool> setInit(UserAccountResponse userAccount) async {
    userAccountResponse = userAccount;
    return true;
  }

  void onTapPaymentMethod(int value) {
    paymentMethod.value = value;
  }


  void moveChargeView(BuildContext context) async{
    if (amountController.text.isEmpty) {
      CustomSnackBar().show(context, "Please enter the recharge amount.");
      return;
    }

    final double amount = double.tryParse(amountController.text) ?? 0;
    print("amount");
    print(amount);
    if (amount <= 0.0) {
      CustomSnackBar().show(context, "Invalid recharge amount.");
      return;
    }
    if (amount > 0.0) {
       PaymentService().paypal(double.parse(amountController.text), context);


    }
  }
}
