import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:home_and_job/account/login/view/MainLoginView.dart';
import 'package:home_and_job/model/user/response/UserProfileResponse.dart';
import 'package:home_and_job/utils/DiskDatabase.dart';
import 'package:home_and_job/utils/SnackBar.dart';

import '../../../rest-api/user-api/ProfileDetailApi.dart';

class MyProfileController extends GetxController {
  late UserProfileResponse userProfileResponse;

  Future<bool> loadUserProfile() async {
    String? userIdx = await DiskDatabase().getUserId();
    print("Dasdasdas");
    print("userIdx = " + userIdx!);
    userProfileResponse =
        (await ProfileDetailApi().loadUserProfile(int.parse(userIdx!)))!;
    return true;
  }

  void logOut(BuildContext context) async {
    await DiskDatabase().removeAllMemory();
    CustomSnackBar().show(context, "LogOut");
    Get.offAll(() => MainLoginView());
  }

  void signOut() async {}
}
