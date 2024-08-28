
import 'package:get/get.dart';
import 'package:home_and_job/model/user/response/UserProfileResponse.dart';
import 'package:home_and_job/utils/DiskDatabase.dart';

import '../../../rest-api/user-api/ProfileDetailApi.dart';

class MyProfileController extends GetxController {
  late UserProfileResponse _userProfileResponse;

  late UserProfileResponse userProfileResponse;

  Future<bool> loadUserProfile() async{
    String? userIdx = await DiskDatabase().getUserId();
    userProfileResponse = (await ProfileDetailApi().loadUserProfile(int.parse(userIdx!)))!;
    return true;
  }


}