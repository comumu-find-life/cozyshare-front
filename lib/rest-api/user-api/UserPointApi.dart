import 'package:flutter/cupertino.dart';
import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:home_and_job/model/home/response/HomeOverviewResponse.dart';
import 'package:home_and_job/utils/ApiUrls.dart';
import 'package:home_and_job/utils/DiskDatabase.dart';
import 'package:home_and_job/utils/RestApiUtils.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../model/home/response/HomeInformationResponse.dart';
import '../../model/user/request/UserAccountRequest.dart';
import '../../model/user/response/UserAccountResponse.dart';
import '../../model/user/response/UserProfileResponse.dart';

class UserPointApi {
  final RestApiUtils apiUtils = RestApiUtils();

  Future<UserAccountResponse?> loadUserAccount() async {
    String? userId = await DiskDatabase().getUserId();
    var url = ApiUrls.USER_ACCOUNT_URL.replaceAll("{userId}", userId!);
    var response = await apiUtils.callGetApiWithToken(url);

    if (apiUtils.isValidResponse(response)) {
      var decode = json.decode(utf8.decode(response.bodyBytes))["data"];
      if (decode == null) {
        return null;
      }
      return UserAccountResponse.fromJson(
          json.decode(utf8.decode(response.bodyBytes))["data"]);
    }
    return null;
  }

  Future<bool> createAccountInformation(
      UserAccountRequest userAccountRequest) async {
    var userId = await DiskDatabase().getUserId();
    var accessToken = await DiskDatabase().getAccessToken();
    var url =
        ApiUrls.USER_ACCOUNT_URL.replaceAll("{userId}", userId.toString());

    var response = await apiUtils.postResponse(url, userAccountRequest,
        accessToken: accessToken);

    if (apiUtils.isValidResponse(response)) {
      return true;
    }
    return false;
  }




  Future<bool> applyWithDraw(int point) async {
    var accessToken = await DiskDatabase().getAccessToken();

    var url = ApiUrls.APPLY_WITH_DRAW_URL + point.toString();

    var response =
        await apiUtils.postResponse(url, point, accessToken: accessToken);


    if (apiUtils.isValidResponse(response)) {
      return true;
    }
    return false;
  }

  Future<bool> isExistAccount() async {
    var userId = await DiskDatabase().getUserId();

    var url = ApiUrls.USER_ACCOUNT_VALIDATE_URL
        .replaceAll("{userId}", userId.toString());

    var response = await apiUtils.callGetApiWithToken(url);

    return json.decode(utf8.decode(response.bodyBytes))["data"];
  }
}
