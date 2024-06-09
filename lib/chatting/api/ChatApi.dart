import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import '../../model/chat/DirectMessageApplicationDto.dart';
import '../../model/chat/response/DirectMessageRoomInfoDto.dart';
import '../../model/chat/response/DirectMessageRoomListDto.dart';

class ChatApi {
  Future<bool> sendDm(DirectMessageApplicationDto dm) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String accessToken = await prefs.getString("access_token")!;

    Response response = await http.post(
      Uri.parse("http://10.0.2.2:8080/" + "v1/api/dm"),
      headers: {
        'Authorization': 'Bearer ${accessToken}',
        'Content-Type': 'application/json',
      },
      body: json.encode(dm.toJson()),
    );
    // 서버 응답 출력

    if (response.statusCode == 200) {
      return true;
    }

    return false;
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
      List<dynamic> jsonResponse = jsonDecode(utf8.decode(response.bodyBytes));
      items = jsonResponse
          .map((json) => DirectMessageRoomListDto.fromJson(json))
          .toList();
    }

    return items;
  }

  Future<List<DirectMessageRoomInfoDto>> loadDmInformation(int dmRoomId) async {
    List<DirectMessageRoomInfoDto> items = [];

    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? accessToken = prefs.getString("access_token");


    final response = await http.get(
      Uri.parse("http://10.0.2.2:8080/v1/api/dm/dm-rooms/" + dmRoomId.toString()),
      headers: {
        'Authorization': 'Bearer $accessToken',
        'Content-Type': 'application/json',
      },
    );


    if (response.statusCode == 200) {
      // List<dynamic> jsonResponse = jsonDecode(utf8.decode(response.bodyBytes));
      // print(jsonResponse);
      // print("dasdasdas");
      //
      // items = jsonResponse
      //     .map((json) => DirectMessageRoomInfoDto.fromJson(json))
      //     .toList();
    }


    return items;
  }
}
