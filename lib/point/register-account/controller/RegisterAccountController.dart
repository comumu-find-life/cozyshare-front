import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:home_and_job/my-profile/my-homes/edit-home/detail-view/view/FinishView.dart';
import 'package:home_and_job/rest-api/user-api/ProfileDetailApi.dart';
import 'package:home_and_job/utils/SnackBar.dart';

import '../../../model/user/request/UserAccountRequest.dart';
import '../../../rest-api/user-api/UserPointApi.dart';

class RegisterAccountController extends GetxController {
  RxBool canRegister = false.obs;
  TextEditingController depositorNameController = TextEditingController();
  TextEditingController bsbController = TextEditingController();
  TextEditingController accountNumberController = TextEditingController();

  void validateInput() {
    if (depositorNameController.text == "" ||
        bsbController.text == "" ||
        accountNumberController.text == "") {
      canRegister.value = false;
    } else {
      canRegister.value = true;
    }
  }

  void createAccount(BuildContext context) async {
    var userAccountRequest = UserAccountRequest(
        depositorName: depositorNameController.text,
        bsb: bsbController.text,
        accountNumber: accountNumberController.text);

    var response =
        await UserPointApi().createAccountInformation(userAccountRequest);
    if (response) {
      Get.to(() => FinishView("Successful!", "Please touch the screen."));
    } else {
      CustomSnackBar().show(context, "Error");
    }
  }
}
