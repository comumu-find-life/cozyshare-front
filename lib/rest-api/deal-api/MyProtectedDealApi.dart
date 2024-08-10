import 'dart:convert';
import 'package:home_and_job/utils/DiskDatabase.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import '../../model/deal/request/ProtectedDealFindRequest.dart';
import '../../model/deal/request/ProtectedDealGeneratorRequest.dart';
import '../../model/deal/response/ProtectedDealByProviderResponse.dart';
import '../../model/deal/response/ProtectedDealResponse.dart';
import '../../utils/ApiUrls.dart';
import '../../utils/RestApiUtils.dart';

class MyProtectedDealApi {
  final RestApiUtils apiUtils = RestApiUtils();


  /**
   * 모든 안전거래 정보 조회
   */
  Future<ProtectedDealByProviderResponse?> loadMyDeals(ProtectedDealFindRequest request) async {
    String? accessToken = await DiskDatabase().getAccessToken();
    String? userId = await DiskDatabase().getUserId();

    var response = await apiUtils.getResponse(ApiUrls.DEAL_MY_READ_URL +  userId!, accessToken: accessToken);

    if(response.statusCode == 200 && json.decode(utf8.decode(response.bodyBytes))["data"] != null){
      return ProtectedDealByProviderResponse.fromJson(json.decode(utf8.decode(response.bodyBytes))["data"]);
    }
    return null;
  }





}
