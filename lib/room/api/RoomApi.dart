import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:home_and_job/model/home/response/HomeOverviewResponse.dart';
import 'package:http/http.dart' as http;

import '../../model/home/response/HomeInformationResponse.dart';

class RoomApi {
  static String ROOT_URL = dotenv.get("ROOT_API_URL");
  static String LOAD_ALL_ROOMS_URL = ROOT_URL + "homes/overview";
  static String FIND_HOME_BY_ID_URL = ROOT_URL + "homes/";

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

  Future<HomeInformationResponse?> findById(int homeIdx) async {

    //todo 리팩토링
    var response = await http.get(

      Uri.parse(FIND_HOME_BY_ID_URL + homeIdx.toString()),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
    );

    print("");
    print(utf8.decode(response.bodyBytes));

    if (response.statusCode == 200) {
      return HomeInformationResponse.fromJson(
          json.decode(utf8.decode(response.bodyBytes))["data"]);
    }
    return null;
  }
}
