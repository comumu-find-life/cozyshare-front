import 'dart:convert';
import 'dart:ffi';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:home_and_job/account/sign-up/view/RegisterProfileView.dart';
import 'package:home_and_job/utils/DiskDatabase.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;

import '../../main/main/frame/MainFrameView.dart';
import '../../utils/ApiUrls.dart';

class LoginApi with ChangeNotifier {
  Future<bool> login(String email, String password) async {
    Response response = await http.post(
      Uri.parse(ApiUrls.USER_LOGIN_URL),
      headers: {
        'Content-Type': 'application/json',
      },
      body: json.encode({'email': email, 'password': password}),
    );

    if (response.statusCode == 200) {
      saveToken(response);
      String accessToken =
          json.decode(utf8.decode(response.bodyBytes))["data"]["accessToken"];
      checkUserId(accessToken);
      return true;
    }
    return false;
  }

  Future<void> loginGoogle(String? idToken) async {
    // 플랫폼 정보 확인
    final platformType = Platform.isAndroid ? "ANDROID" : Platform.isIOS ? "IOS" : "Unknown";

    // 서버로 토큰 전송
    final response = await http.post(
      Uri.parse(ApiUrls.GOOGLE_AUTH_LOGIN),
      headers: {'Content-Type': 'application/json'},
      body: '{"idToken": "$idToken", "platformType" : "$platformType"}',
    );

    if (response.statusCode == 200) {
      bool isExsit = json.decode(utf8.decode(response.bodyBytes))["success"];

      if (isExsit) {
        saveToken(response);
        String accessToken = json.decode(utf8.decode(response.bodyBytes))["data"]["accessToken"];
        checkUserId(accessToken);
        Get.to(() => MainFrameView(0));
      } else {
        String email = json.decode(utf8.decode(response.bodyBytes))["data"];
        Get.to(() => RegisterProfileView(email));
      }
      // LoginApi().saveToken(response);
    } else {
      throw Exception('서버 인증 실패');
    }
  }

  Future<bool> reLogin() async {
    String? loginId = await DiskDatabase().getLoginId();
    String? loginPassword = await DiskDatabase().getLoginPassword();
    return await login(loginId!, loginPassword!);
  }

  void checkUserId(String accessToken) async {
    String? id = await loadUserId(accessToken);
    await DiskDatabase().setUserId(id!);
  }

  Future<String?> loadUserId(String accessToken) async {
    Response response = await http.get(
      Uri.parse(ApiUrls.USER_ID_FIND_URL),
      headers: {
        'Authorization': 'Bearer $accessToken',
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      int userId = json.decode(utf8.decode(response.bodyBytes))["data"];
      return userId.toString();
    }

    return null;
  }

  void saveUserId(Response response) async {}

  void saveToken(Response response) async {
    String accessToken =
        json.decode(utf8.decode(response.bodyBytes))["data"]["accessToken"];
    String refreshToken =
        json.decode(utf8.decode(response.bodyBytes))["data"]["refreshToken"];
    await DiskDatabase().setAccessToken(accessToken);
    await DiskDatabase().setRefreshToken(refreshToken);
  }
}
