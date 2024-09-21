import 'dart:convert';
import 'dart:ffi';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:home_and_job/utils/DiskDatabase.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;

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
      String accessToken = json.decode(utf8.decode(response.bodyBytes))["data"]["accessToken"];
      checkUserId(accessToken);
      return true;
    }
    return false;
  }

  Future<bool> reLogin() async {
    String? loginId = await DiskDatabase().getLoginId();
    String? loginPassword = await DiskDatabase().getLoginPassword();
    return await login(loginId!, loginPassword!);
  }

  void checkUserId(String accessToken) async {

    String? id = await loadUserId(accessToken);
    await DiskDatabase().setUserId(id!);
    //todo 변경
    // String? userId = await DiskDatabase().getUserId();
    // if (userId == null) {
    //   String? id = await loadUserId(accessToken);
    //   await DiskDatabase().setUserId(id!);
    // }
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
