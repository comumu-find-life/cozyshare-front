import 'package:flutter/cupertino.dart';
import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:home_and_job/model/home/response/HomeOverviewResponse.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../model/home/response/HomeInformationResponse.dart';

class RoomApi {
  static String ROOT_URL = dotenv.get("ROOT_API_URL");
  static String LOAD_ALL_ROOMS_URL = ROOT_URL + "homes/overview";
  static String FIND_HOME_BY_ID_URL = ROOT_URL + "home?homeId=";

  Future<List<HomeOverviewResponse>> loadAllReward() async {

    List<HomeOverviewResponse> rewards = [];

    var response = await http.get(
      Uri.parse(LOAD_ALL_ROOMS_URL),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
    );

    print(utf8.decode(response.bodyBytes));

    if (response.statusCode == 200) {
      rewards = List<HomeOverviewResponse>.from(json
          .decode(utf8.decode(response.bodyBytes))["data"]
          .map((x) => HomeOverviewResponse.fromJson(x)));

    }

    return rewards;
  }

  Future<HomeInformationResponse?> findById(int homeIdx) async{
    final url = FIND_HOME_BY_ID_URL + homeIdx.toString();

    //todo 리팩토링
    var response = await http.get(
      Uri.parse(ROOT_URL + "home?homeId="+homeIdx.toString()),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
    );

    print("dasdas");
    print(utf8.decode(response.bodyBytes));

    if(response.statusCode == 200) {
      return HomeInformationResponse.fromJson(json.decode(utf8.decode(response.bodyBytes))["data"]);
    }
    return null;
  }
}