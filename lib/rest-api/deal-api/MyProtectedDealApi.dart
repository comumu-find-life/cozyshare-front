import 'dart:convert';
import 'package:home_and_job/model/deal/response/ProtectedDealResponse.dart';
import 'package:home_and_job/utils/DiskDatabase.dart';

import '../../utils/ApiUrls.dart';
import '../../utils/RestApiUtils.dart';

class MyProtectedDealApi {

  final RestApiUtils apiUtils = RestApiUtils();

  /**
   * 모든 안전거래 정보 조회
   */
  Future<List<ProtectedDealResponse>?> loadMyDeals() async {
    String? accessToken = await DiskDatabase().getAccessToken();
    String? userId = await DiskDatabase().getUserId();

    var response = await apiUtils.getResponse(ApiUrls.DEAL_MY_READ_URL +  userId!, accessToken: accessToken);

    if (response.statusCode == 200) {
      var decodedResponse = json.decode(utf8.decode(response.bodyBytes));
      if (decodedResponse["data"] != null) {
        List<dynamic> dataList = decodedResponse["data"];
        List<ProtectedDealResponse> deals = dataList.map((data) {
          return ProtectedDealResponse.fromJson(data);
        }).toList();

        return deals;
      }
    }
    return null;
  }
}
