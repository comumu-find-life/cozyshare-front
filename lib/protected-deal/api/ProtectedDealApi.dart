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
import '../../model/deal/request/ProtectedDealGeneratorRequest.dart';

class ProtectedDealApi {
  static String ROOT_URL = dotenv.get("ROOT_API_URL");
  final String START_DEAL_URL = ROOT_URL + "deal";

  Future<bool> startDeal(
      ProtectedDealGeneratorRequest dealGeneratorRequest) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String accessToken = await prefs.getString("access_token")!;
    Response response = await http.post(
      Uri.parse(START_DEAL_URL),
      headers: {
        'Authorization': 'Bearer ${accessToken}',
        'Content-Type': 'application/json',
      },
      body: json.encode(dealGeneratorRequest.toJson()),
    );
    // 서버 응답 출력

    if (response.statusCode == 200) {
      return true;
    }

    return false;
  }
}
