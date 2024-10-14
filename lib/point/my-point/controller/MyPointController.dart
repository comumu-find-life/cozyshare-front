
import 'package:get/get.dart';
import 'package:home_and_job/model/user/response/UserAccountResponse.dart';
import 'package:home_and_job/rest-api/user-api/ProfileDetailApi.dart';
import 'package:home_and_job/utils/DiskDatabase.dart';
import 'package:home_and_job/utils/RestApiUtils.dart';

class MyPointController extends GetxController{
  UserAccountResponse? userAccountResponse;

  Future<bool> loadInit(UserAccountResponse userAccount) async{
    userAccountResponse = userAccount;

    return true;
  }

  bool isExistUserAccount(){
    if(userAccountResponse == null) {
      return false;
    }
    return true;
  }
}