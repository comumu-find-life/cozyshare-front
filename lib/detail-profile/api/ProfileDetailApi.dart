
import 'package:flutter/cupertino.dart';
import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:home_and_job/model/home/response/HomeOverviewResponse.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../model/home/response/HomeInformationResponse.dart';
import '../../model/user/response/UserProfileResponse.dart';

class ProfileDetailApi {
  static String ROOT_URL = dotenv.get("ROOT_API_URL");
  final String LOAD_USER_PROFILE_URL = ROOT_URL + "users/profile/";

  Future<UserProfileResponse?> loadUserProfile(int userIdx) async {
    var response = await http.get(


      Uri.parse(LOAD_USER_PROFILE_URL+userIdx.toString()),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
    );


    if (response.statusCode == 200) {
      return UserProfileResponse.fromJson(json.decode(utf8.decode(response.bodyBytes))["data"]);
    }

    return null;
  }
}