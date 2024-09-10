import 'dart:convert';
import 'package:home_and_job/utils/DiskDatabase.dart';

import '../../model/deal/response/MyProtectedDealResponse.dart';
import '../../model/deal/response/ProtectedDealByProviderResponse.dart';
import '../../utils/ApiUrls.dart';
import '../../utils/RestApiUtils.dart';

class MyProtectedDealApi {
  final RestApiUtils apiUtils = RestApiUtils();

  /**
   * 모든 안전거래 정보 조회
   */
  Future<List<MyProtectedDealResponse>?> loadMyDeals() async {
    String? accessToken = await DiskDatabase().getAccessToken();
    String? userId = await DiskDatabase().getUserId();

    var response = await apiUtils.getResponse(ApiUrls.DEAL_MY_READ_URL +  userId!, accessToken: accessToken);

    if (response.statusCode == 200) {
      var decodedResponse = json.decode(utf8.decode(response.bodyBytes));

      if (decodedResponse["data"] != null) {
        List<dynamic> dataList = decodedResponse["data"];
        List<MyProtectedDealResponse> deals = dataList.map((data) {
          return MyProtectedDealResponse.fromJson(data);
        }).toList();

        return deals;
      }
    }
    return null;
  }





}
