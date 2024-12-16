
import 'dart:convert';

import '../../utils/ApiUrls.dart';
import '../../utils/RestApiUtils.dart';

class AccountApi {
  final RestApiUtils apiUtils = RestApiUtils();

  Future<bool> checkDuplicateEmail(String email) async{
    print(ApiUrls.CHECK_DUPLICATE_EMAIL_URL+ email);
    var response =await apiUtils.getResponse(ApiUrls.CHECK_DUPLICATE_EMAIL_URL+ email);

    print(utf8.decode(response.bodyBytes));
    if(apiUtils.isValidResponse(response)) {
      bool result = apiUtils.decodeResponse(response);
      print("result = " + result.toString());
      return result;
    }
    return false;

  }

  Future<bool> sendCheckCodeToEmail(String email)async{

    var response =await apiUtils.postResponse(ApiUrls.SEND_EMAIL_URL+ email, null);

    if(apiUtils.isValidResponse(response)) {
      return true;
    }
    return false;
  }

  Future<bool> verifySignUpCode(String email, String code)async{

    var response =await apiUtils.postResponse(ApiUrls.CEHCK_EMAIL_CODE_URL+ email +"/${code}", null);

    print("response = " + utf8.decode(response.bodyBytes));

    if(apiUtils.isValidResponse(response)) {
      bool result = apiUtils.decodeResponse(response);
      print("result = " + result.toString());
      if(result){
        return true;
      }
      return false;
    }
    return false;
  }

}