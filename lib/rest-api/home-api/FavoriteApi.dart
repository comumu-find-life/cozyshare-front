import 'package:flutter/cupertino.dart';
import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:home_and_job/model/home/response/HomeOverviewResponse.dart';
import 'package:home_and_job/utils/ApiUrls.dart';
import 'package:home_and_job/utils/DiskDatabase.dart';
import 'package:http/http.dart' as http;


class FavoriteApi {
  // static String ROOT_URL = dotenv.get("ROOT_API_URL");
  // static String LOAD_FACORITE_ROOMS_URL = ROOT_URL + "homes/favorite";

  Future<List<HomeOverviewResponse>> loadAllReward(List<String> homeIds) async {
    String? accessToken = await DiskDatabase().getAccessToken();
    List<HomeOverviewResponse> rewards = [];

    // homeIds를 쿼리 매개변수로 변환
    String queryParameters = homeIds.map((id) => 'homeIds=$id').join('&');

    var response = await http.get(
      Uri.parse(ApiUrls.ROOM_FAVORITE_URL + '?$queryParameters'),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization' : 'Bearer $accessToken'
      },
    );

    if (response.statusCode == 200) {
      rewards = List<HomeOverviewResponse>.from(json
          .decode(utf8.decode(response.bodyBytes))["data"]
          .map((x) => HomeOverviewResponse.fromJson(x)));
    }

    return rewards;
  }
}