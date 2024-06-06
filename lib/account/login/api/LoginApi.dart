import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class LoginApi with ChangeNotifier {
  String ROOT_URL = dotenv.get("ROOT_API_URL");

  Future<bool> login(String email, String password) async {
    Response response = await http.post(
      Uri.parse("http://10.0.2.2:8080/" + "login"),
      headers: {
        'Content-Type': 'application/json',
      },
      body: json.encode({'email': email, 'password': password}),
    );

    // 서버 응답 출력

    if (response.statusCode == 200) {
      saveToken(response);
      return true;
    }

    return false;
  }

  void saveToken(Response response) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    String accessToken =
        json.decode(utf8.decode(response.bodyBytes))["accessToken"];
    String refreshToken =
        json.decode(utf8.decode(response.bodyBytes))["refreshToken"];
    prefs.setString("access_token", accessToken);
    prefs.setString("refresh_token", refreshToken);

  }
}
