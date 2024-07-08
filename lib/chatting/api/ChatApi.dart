import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:home_and_job/model/home/response/HomeOverviewResponse.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:stomp_dart_client/stomp_dart_client.dart';

import '../../model/chat/request/DirectMessageApplicationDto.dart';
import '../../model/chat/response/DirectMessageDto.dart';
import '../../model/chat/response/DirectMessageRoomInfoDto.dart';
import '../../model/chat/response/DirectMessageRoomListDto.dart';

class ChatApi {
  static String ROOT_URL = dotenv.get("ROOT_API_URL");
  final String SEND_INIT_DM_URL = ROOT_URL + "dm";
  final String LOAD_BY_USERS_HOME = ROOT_URL + "homes/dm";

  Future<int> sendDm(DirectMessageApplicationRequest dm) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String accessToken = await prefs.getString("access_token")!;
    Response response = await http.post(

      Uri.parse("http://10.0.2.2:8080/v1/api/dm"),
      headers: {
        'Authorization': 'Bearer ${accessToken}',
        'Content-Type': 'application/json',
      },
      body: json.encode(dm.toJson()),
    );
    // 서버 응답 출력


    if (response.statusCode == 200) {
      var responseBody = json.decode(utf8.decode(response.bodyBytes));
      int roomId = responseBody["data"];
      return roomId;
    }

    return -1;
  }

  Future<List<DirectMessageResponse>> loadDmMessages(int user1Id, int user2Id) async {
    List<DirectMessageResponse> items = [];

    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? accessToken = prefs.getString("access_token");

    final response = await http.get(
      Uri.parse("http://10.0.2.2:8082/api/dm/history?user1Id=${user1Id}&user2Id=${user2Id}"),
      headers: {
        'Authorization': 'Bearer $accessToken',
        'Content-Type': 'application/json',
      },
    );


    print("LOAD DM");
    print(utf8.decode(response.bodyBytes));
    if (response.statusCode == 200) {
      List<dynamic> jsonResponse = jsonDecode(utf8.decode(response.bodyBytes));
      items = jsonResponse
          .map((json) => DirectMessageResponse.fromJson(json))
          .toList();
    }
    print(items.length);
    return items;
  }

  Future<List<DirectMessageRoomListDto>> loadDmList() async {
    List<DirectMessageRoomListDto> items = [];

    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? accessToken = prefs.getString("access_token");


    final response = await http.get(
      Uri.parse("http://10.0.2.2:8080/v1/api/dm/dm-rooms"),
      headers: {
        'Authorization': 'Bearer $accessToken',
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      List<dynamic> jsonResponse = jsonDecode(utf8.decode(response.bodyBytes))["data"];
      items = jsonResponse
          .map((json) => DirectMessageRoomListDto.fromJson(json))
          .toList();
    }

    return items;
  }

  Future<List<HomeOverviewResponse>> loadHomes() async {
    List<HomeOverviewResponse> homes = [];

    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? accessToken = prefs.getString("access_token");


    final response = await http.get(
      Uri.parse(LOAD_BY_USERS_HOME),
      headers: {
        'Authorization': 'Bearer $accessToken',
        'Content-Type': 'application/json',
      },
    );

    if(response.statusCode == 200){
      homes = List<HomeOverviewResponse>.from(json
          .decode(utf8.decode(response.bodyBytes))["data"]
          .map((x) => HomeOverviewResponse.fromJson(x)));
    }
    return homes;

  }
}
