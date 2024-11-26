
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:home_and_job/my-profile/my-homes/edit-home/detail-view/view/FinishView.dart';
import 'package:home_and_job/rest-api/user-api/UserPointApi.dart';

import '../../../utils/SnackBar.dart';

class BankTransferController extends GetxController{
  
  void applyDeposit(BuildContext context, int point)async{
    bool response = await UserPointApi().applyDepositByAccount(point);

    if(response){
      Get.to(() => FinishView("Successful!", "Please touch the screen."));
    }else{
      CustomSnackBar().show(context, "Failed to charge point");
    }
    
  }
}