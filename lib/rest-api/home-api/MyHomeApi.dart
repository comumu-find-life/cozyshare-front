import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:home_and_job/model/home/enums/HomeStatus.dart';
import 'package:home_and_job/model/home/request/HomeAddressGeneratorRequest.dart';
import 'package:home_and_job/model/home/request/HomeGeneratorRequest.dart';
import 'package:home_and_job/model/home/request/HomeUpdateRequest.dart';
import 'package:home_and_job/model/home/response/HomeOverviewResponse.dart';
import 'package:home_and_job/model/home/response/LatLng.dart';
import 'package:home_and_job/model/user/request/SignupRequest.dart';
import 'package:home_and_job/utils/DiskDatabase.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyHomeApi {
  static String ROOT_URL = dotenv.get("ROOT_API_URL");
  final String READ_MY_HOMES_URL = ROOT_URL + "homes/users/";
  final String CHANGE_STATUS_URL = ROOT_URL + "homes/";
  final String EDIT_HOME_INFORMATION_URL = ROOT_URL + "homes";

  Future<List<HomeOverviewResponse>> searchMyHomes() async {
    List<HomeOverviewResponse> homes = [];

    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String accessToken = await prefs.getString("access_token")!;
    String? userId = await DiskDatabase().getUserId();

    var response = await http.get(
      Uri.parse(READ_MY_HOMES_URL + userId!),
      headers: {
        'Authorization': 'Bearer $accessToken',
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      homes = List<HomeOverviewResponse>.from(json
          .decode(utf8.decode(response.bodyBytes))["data"]
          .map((x) => HomeOverviewResponse.fromJson(x)));
    }

    return homes;
  }

  Future<bool> updateHomeInformation(HomeUpdateRequest homeUpdateRequest) async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String accessToken = await prefs.getString("access_token")!;

    var response = await http.patch(
      Uri.parse(
          EDIT_HOME_INFORMATION_URL),
      headers: {
        'Authorization': 'Bearer $accessToken',
        'Content-Type': 'application/json',
      },
      body: json.encode(homeUpdateRequest.toJson())
    );

    if (response.statusCode == 200) {
      return true;
    }

    return false;
  }

  Future<bool> changeStatus(HomeStatus homeStatus, int homeId) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String accessToken = await prefs.getString("access_token")!;

    var response = await http.patch(
      Uri.parse(
          CHANGE_STATUS_URL + homeId.toString() + "/status/" + homeStatus.name),
      headers: {
        'Authorization': 'Bearer $accessToken',
        'Content-Type': 'application/json',
      },
    );
    if (response.statusCode == 200) {
      return true;
    }

    return false;
  }
}
