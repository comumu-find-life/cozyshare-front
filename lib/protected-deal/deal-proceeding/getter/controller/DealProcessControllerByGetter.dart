import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:home_and_job/my-profile/my-homes/edit-home/detail-view/view/FinishView.dart';
import 'package:home_and_job/rest-api/deal-api/ProtectedDealApi.dart';
import 'package:home_and_job/utils/SnackBar.dart';

class DealProcessControllerByGetter extends GetxController {
  Rx<bool> _canFinish = false.obs;

  // 1 = 입금 확인 중, 2= 입금 확인, 3=거래 완료

  void checkAgree(bool value){
    _canFinish.value = value;
  }

  void cancelDeal(int dealId, BuildContext context)async{
    var bool = await ProtectedDealApi().cancelDealAfterDeposit(dealId);
    if(bool){
      Get.to(() => FinishView("Transactn Cancel!", "The points have been refunded after deducting the fee."));
    }else{
      CustomSnackBar().show(context, "Server Error");
    }
  }

  bool get canFinish => _canFinish.value;
}
