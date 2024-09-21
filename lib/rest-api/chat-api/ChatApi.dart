import 'dart:convert';
import 'package:home_and_job/utils/DiskDatabase.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../model/chat/request/DirectMessageApplicationDto.dart';
import '../../model/chat/response/DirectMessageDto.dart';
import '../../model/chat/response/DirectMessageRoomListDto.dart';
import '../../utils/ApiUrls.dart';
import '../../utils/RestApiUtils.dart';
import '../user-api/LoginApi.dart';

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
  Future<List<DirectMessageRoomListResponse>> loadDmList() async {
    List<DirectMessageRoomListResponse> items = [];

    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var userId = await DiskDatabase().getUserId();
    var response = await apiUtils.callGetApiWithToken(ApiUrls.DM_ROOMS + userId.toString());

    print(utf8.decode(response.bodyBytes));

    if (apiUtils.isValidResponse(response)) {
      List<dynamic> jsonResponse = apiUtils.decodeResponse(response);
      items = jsonResponse
          .map((json) => DirectMessageRoomListResponse.fromJson(json))
          .toList();
    }

    return items;
  }



}