import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:home_and_job/account/login/google-oauth2/GoogleAuthService.dart';
import 'package:home_and_job/rest-api/user-api/LoginApi.dart';
import 'package:home_and_job/utils/DiskDatabase.dart';
import 'package:home_and_job/utils/SnackBar.dart';

import '../../../main/main/frame/MainFrameView.dart';

class MainLoginController extends GetxController {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _pwController = TextEditingController();

  void login(BuildContext context) async {
    bool response =
        await LoginApi().login(_emailController.text, _pwController.text);
    if (response) {
      await DiskDatabase().setLoginId(_emailController.text);
      await DiskDatabase().setLoginPassword(_pwController.text);
      Get.to(() => MainFrameView(0));
    } else {
      CustomSnackBar().show(context, "Fail to login");
    }
  }


  void loginGoogle()async{
     GoogleAuthService().signInWithGoogle();
  }


  TextEditingController get pwController => _pwController;

  TextEditingController get emailController => _emailController;
}
