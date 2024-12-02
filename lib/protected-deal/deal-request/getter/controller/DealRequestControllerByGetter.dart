
import 'dart:async';

import 'package:get/get.dart';
import 'package:home_and_job/model/user/response/UserAccountResponse.dart';
import 'package:home_and_job/my-profile/my-homes/edit-home/detail-view/view/FinishView.dart';
import 'package:home_and_job/rest-api/deal-api/ProtectedDealApi.dart';
import 'package:home_and_job/rest-api/user-api/UserPointApi.dart';

class DealRequestControllerByGetter extends GetxController{
  Rx<bool> _canNext = false.obs;

  void checkAgree(bool? value){
    _canNext.value = value!;
  }

  Future<bool> acceptDeal(int dealId)async{
    bool response = await ProtectedDealApi().acceptDealByGetter(dealId);
    if(response){
      return true;
    }
    return false;
  }

  Future<void> cancelDealBeforeDeposit(int dealId) async {
    bool response = await ProtectedDealApi().cancelDealBeforeDeposit(dealId);
    if(response) {
      Get.to(() => FinishView("Cancel Transaction", "The transaction has been canceled.\n Tap the screen to go to the main page."));
    }
  }




  bool get canNext => _canNext.value;
}