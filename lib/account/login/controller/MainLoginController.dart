import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:home_and_job/rest-api/user-api/LoginApi.dart';
import 'package:home_and_job/utils/SnackBar.dart';

import '../../../main/main/frame/MainFrameView.dart';

class MainLoginController extends GetxController {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _pwController = TextEditingController();

  void login(BuildContext context) async {
    bool response =
        await LoginApi().login(_emailController.text, _pwController.text);
    if (response) {
      Get.to(() => MainFrameView(0));
    } else {
      CustomSnackBar().show(context, "Fail to login");
    }
  }

  TextEditingController get pwController => _pwController;

  TextEditingController get emailController => _emailController;
}
