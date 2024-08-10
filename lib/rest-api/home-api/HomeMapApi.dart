import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:home_and_job/model/home/response/HomeOverviewResponse.dart';
import 'package:flutter/cupertino.dart';
import 'dart:convert';

import 'package:home_and_job/utils/ApiUrls.dart';
import 'package:http/http.dart' as http;

class HomeMapApi {


  Future<List<HomeOverviewResponse>> loadAllHomes() async {
    List<HomeOverviewResponse> homes = [];

    var response = await http.get(
      Uri.parse(ApiUrls.ROOMS_ALL_URL),
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
