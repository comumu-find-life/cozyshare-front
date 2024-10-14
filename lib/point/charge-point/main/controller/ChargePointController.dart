
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:home_and_job/model/user/response/UserAccountResponse.dart';
import 'package:home_and_job/rest-api/user-api/UserPointApi.dart';
import 'package:home_and_job/utils/RestApiUtils.dart';
import 'package:home_and_job/utils/SnackBar.dart';

import '../../../../my-profile/my-homes/edit-home/detail-view/view/FinishView.dart';
import '../../../bank-transfer/view/BankTransferView.dart';
import '../../../bank-transfer/view/InputBankTransferFormView.dart';
import '../../../paypal/view/PaypalView.dart';

class ChargePointController extends GetxController{
  RxInt paymentMethod = 0.obs;
  late UserAccountResponse userAccountResponse;
  TextEditingController amountController = TextEditingController();
  RestApiUtils apiUtils = RestApiUtils();

  Future<bool> setInit(UserAccountResponse userAccount) async{
    userAccountResponse = userAccount;
    return true;
  }

  void onTapPaymentMethod(int value){
    paymentMethod.value = value;
  }


  void moveChargeView(BuildContext context){
    if(amountController.text == "" || paymentMethod == 0){
      CustomSnackBar().show(context, "Please enter all values.");
    }
    else if(paymentMethod.value == 1){
      Get.to(() => PayPalPaymentView(int.parse(amountController.text)));
    }
    else if(paymentMethod.value == 2) {
      Get.to(() => InputBankTransferFormView(int.parse(amountController.text)));
    }
  }

  void chargePoint(BuildContext context)async{

    bool response = await UserPointApi().chargePoint(int.parse(amountController.text));

    if(response){
      Get.to(() => FinishView("Successful!", "Please touch the screen."));
    }else{
      CustomSnackBar().show(context, "Failed to charge point");
    }



  }
}