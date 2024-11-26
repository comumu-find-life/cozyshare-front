
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:home_and_job/model/user/response/UserAccountResponse.dart';
import 'package:home_and_job/my-profile/my-homes/edit-home/detail-view/view/FinishView.dart';
import 'package:home_and_job/rest-api/user-api/UserPointApi.dart';
import 'package:home_and_job/utils/SnackBar.dart';

class MyPointController extends GetxController{
  UserAccountResponse? userAccountResponse;
  TextEditingController cashOutTextController = TextEditingController();

  Future<bool> loadInit(UserAccountResponse userAccount) async{
    userAccountResponse = userAccount;

    return true;
  }

  void withDraw(BuildContext context)async{

    if(cashOutTextController.text == ""){
      CustomSnackBar().show(context, "Please enter the amount to withdraw.");
      return;
    }
    var amount = int.parse(cashOutTextController.text);
    if(userAccountResponse!.point - amount >= 0){
      var response = await UserPointApi().applyWithDraw(amount);
      if(response){
        Get.to(() => FinishView("Withdrawal request completed.", "Funds will be deposited into the account after administrator approval."));
      }else{
        CustomSnackBar().show(context, "Failed to withdraw");
      }
    }else{
      CustomSnackBar().show(context, "Amount exceeds your balance.");
    }
  }

  bool isExistUserAccount(){
    if(userAccountResponse == null) {
      return false;
    }
    return true;
  }


}