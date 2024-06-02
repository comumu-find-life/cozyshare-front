import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class SignupApi with ChangeNotifier {


  void getEnv() async{
    //📲 dotenv을 가져와주는 코드 한줄이 필요하다
    await dotenv.load();
    String url = dotenv.get("PROJECT_URL");
    String key = dotenv.get("PROJECT_API_KEY");
  }


  Future<bool> loginOld(String key) async {
    var ROOT_API = dotenv.get("PROJECT_URL");
    var response = await http.post(Uri.parse(ROOT_API + "senior/login"),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
        body: jsonEncode({"inviteCode": key}));

    //todo 세션 저장
    if (response.statusCode == 200) {

      return true;
    } else {
      return false;
    }
  }
}
