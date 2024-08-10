import 'dart:convert';
import 'package:home_and_job/model/home/enums/HomeStatus.dart';
import 'package:home_and_job/model/home/request/HomeUpdateRequest.dart';
import 'package:home_and_job/model/home/response/HomeOverviewResponse.dart';
import 'package:home_and_job/utils/ApiUrls.dart';
import 'package:home_and_job/utils/DiskDatabase.dart';
import 'package:home_and_job/utils/RestApiUtils.dart';

class MyHomeApi {
  final RestApiUtils apiUtils = RestApiUtils();

  /**
   * 자신의 집 게시글 조회 API
   */
  Future<List<HomeOverviewResponse>> searchMyHomes() async {
    List<HomeOverviewResponse> homes = [];

    String? accessToken = await DiskDatabase().getAccessToken();
    String? userId = await DiskDatabase().getUserId();

    var response = await apiUtils.getResponse(ApiUrls.ROOM_MY_URL + userId!,
        accessToken: accessToken);

    if (apiUtils.isValidResponse(response)) {
      homes = List<HomeOverviewResponse>.from(json
          .decode(utf8.decode(response.bodyBytes))["data"]
          .map((x) => HomeOverviewResponse.fromJson(x)));
    }
    return homes;
  }

  /**
   * 집 게시글 수정 API
   */
  Future<bool> updateHomeInformation(
      HomeUpdateRequest homeUpdateRequest) async {
    String? accessToken = await DiskDatabase().getAccessToken();

    var response = await apiUtils.patchWithBodyResponse(
        ApiUrls.ROOM_SAVE_URL, homeUpdateRequest,
        accessToken: accessToken);


    return apiUtils.isValidResponse(response);
  }

  Future<bool> changeStatus(HomeStatus homeStatus, int homeId) async {
    String? accessToken = await DiskDatabase().getAccessToken();
    String apiUrl = ApiUrls.ROOM_STATE_CHANGE_URL + homeId.toString() + "/status/" + homeStatus.name;
    print(apiUrl);

    var response = await apiUtils.patchResponse(apiUrl, accessToken: accessToken);


    return apiUtils.isValidResponse(response);
  }
}
