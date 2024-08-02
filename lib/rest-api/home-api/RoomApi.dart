import 'package:home_and_job/model/home/response/HomeOverviewResponse.dart';
import 'package:home_and_job/utils/ApiUrls.dart';

import '../../model/home/response/HomeInformationResponse.dart';
import '../../utils/RestApiUtils.dart';

class RoomApi {
  final RestApiUtils apiUtils = RestApiUtils();

  /**
   * 모든 집 게시글을 조회하는 API
   */
  Future<List<HomeOverviewResponse>> loadAllRooms() async {
    List<HomeOverviewResponse> homes = [];

    var response = await apiUtils.getResponse(ApiUrls.ROOMS_ALL_URL);

    if (apiUtils.isValidResponse(response)) {
      homes = List<HomeOverviewResponse>.from(
          apiUtils.decodeResponse(response).map((x) => HomeOverviewResponse.fromJson(x))
      );
    }

    return homes;
  }

  /**
   * 집 게시글 단일 조회 API
   */
  Future<HomeInformationResponse?> loadRoomById(int homeIdx) async {
    var response = await apiUtils.getResponse(ApiUrls.ROOM_BY_ID_URL + homeIdx.toString());

    if (apiUtils.isValidResponse(response)) {
      return HomeInformationResponse.fromJson(apiUtils.decodeResponse(response));
    }
    return null;
  }
}
