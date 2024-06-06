
import 'package:get/get.dart';
import 'package:home_and_job/detail-profile/api/ProfileDetailApi.dart';
import 'package:home_and_job/model/user/response/UserProfileResponse.dart';

class ProfileDetailController extends GetxController{
  late UserProfileResponse userProfileResponse;

  Future<bool> loadUserProfile(int userIdx) async{
     userProfileResponse = (await ProfileDetailApi().loadUserProfile(userIdx))!;

     print(userProfileResponse.nickname);
     return true;
  }
}