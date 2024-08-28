import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:home_and_job/model/deal/response/ProtectedDealResponse.dart';
import 'package:home_and_job/model/home/response/HomeOverviewResponse.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:stomp_dart_client/stomp_dart_client.dart';

import '../../model/chat/request/DirectMessageApplicationDto.dart';
import '../../model/chat/response/DirectMessageDto.dart';
import '../../model/chat/response/DirectMessageRoomInfoDto.dart';
import '../../model/chat/response/DirectMessageRoomListDto.dart';
import '../../model/deal/request/ProtectedDealFindRequest.dart';
import '../../utils/ApiUrls.dart';
import '../../utils/RestApiUtils.dart';

class DmApi {

  final RestApiUtils apiUtils = RestApiUtils();

  /**
   * 첫 채팅 전송 API
   */
  Future<int> sendInitDm(DirectMessageApplicationRequest dm) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String accessToken = await prefs.getString("access_token")!;

    var response = await apiUtils.postResponse(ApiUrls.DM_INIT_SEND_URL, dm.toJson(), accessToken: accessToken);


    if (apiUtils.isValidResponse(response)) {
      return apiUtils.decodeResponse(response);
    }

    return -1;
  }

  /**
   * 채팅 내용 조회 API
   */
  Future<List<DirectMessageResponse>> loadDmHistory(int user1Id, int user2Id) async {
    List<DirectMessageResponse> items = [];

    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? accessToken = prefs.getString("access_token");

    var response =await apiUtils.getResponse(ApiUrls.DM_HISTORY+ "?user1Id=${user1Id}&user2Id=${user2Id}", accessToken: accessToken);


    if (apiUtils.isValidResponse(response)) {
      List<dynamic> jsonResponse = jsonDecode(utf8.decode(response.bodyBytes));
      items = jsonResponse
          .map((json) => DirectMessageResponse.fromJson(json))
          .toList();
    }
    return items;
  }

  /**
   * 채팅 목록을 조회 하는 API
   */
  Future<List<DirectMessageRoomListDto>> loadDmList() async {
    List<DirectMessageRoomListDto> items = [];

    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? accessToken = prefs.getString("access_token");


    var response = await apiUtils.getResponse(ApiUrls.DM_ROOMS, accessToken: accessToken);


    if (apiUtils.isValidResponse(response)) {
      List<dynamic> jsonResponse = apiUtils.decodeResponse(response);
      items = jsonResponse
          .map((json) => DirectMessageRoomListDto.fromJson(json))
          .toList();
    }

    return items;
  }



}