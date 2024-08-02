import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:home_and_job/model/home/response/HomeOverviewResponse.dart';
import 'package:flutter/cupertino.dart';
import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeMapApi {
  static String ROOT_URL = dotenv.get("ROOT_API_URL");
  static String LOAD_ALL_HOME_URL = ROOT_URL + "homes/overview";


  Future<List<HomeOverviewResponse>> loadAllHomes() async {
    List<HomeOverviewResponse> homes = [];

    var response = await http.get(
      Uri.parse(LOAD_ALL_HOME_URL),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
    );


    if (response.statusCode == 200) {
      homes = List<HomeOverviewResponse>.from(json
          .decode(utf8.decode(response.bodyBytes))["data"]
          .map((x) => HomeOverviewResponse.fromJson(x)));
    }

    return homes;
  }
}
