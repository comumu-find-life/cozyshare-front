import 'dart:convert';
import 'package:home_and_job/model/deal/response/ProtectedDealByGetterResponse.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import '../../model/deal/request/ProtectedDealFindRequest.dart';
import '../../model/deal/request/ProtectedDealGeneratorRequest.dart';
import '../../model/deal/response/ProtectedDealByProviderResponse.dart';
import '../../model/deal/response/ProtectedDealResponse.dart';
import '../../utils/ApiUrls.dart';
import '../../utils/RestApiUtils.dart';

class ProtectedDealApi {
  final RestApiUtils apiUtils = RestApiUtils();


  /**
   * 안전거래 단일 조회 by Provider (In Chatting)
   */
  Future<ProtectedDealByProviderResponse?> loadProtectedDealByProvider(ProtectedDealFindRequest request) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? accessToken = prefs.getString("access_token");

    final response = await http.post(
        Uri.parse(ApiUrls.DEAL_PROVIDER_READ),
        headers: {
          'Authorization': 'Bearer $accessToken',
          'Content-Type': 'application/json',
        },
        body: json.encode(request.toJson())
    );


    if(response.statusCode == 200 && json.decode(utf8.decode(response.bodyBytes))["data"] != null){
      return ProtectedDealByProviderResponse.fromJson(json.decode(utf8.decode(response.bodyBytes))["data"]);
    }
    return null;

  }

  /**
   * 안전거래 단일 조회 by Getter (In Chatting)
   */
  Future<ProtectedDealByGetterResponse?> loadProtectedDealByGetter(ProtectedDealFindRequest request) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? accessToken = prefs.getString("access_token");

    print(ApiUrls.DEAL_PROVIDER_READ);
    final response = await http.post(
        Uri.parse(ApiUrls.DEAL_GETTER_READ),
        headers: {
          'Authorization': 'Bearer $accessToken',
          'Content-Type': 'application/json',
        },
        body: json.encode(request.toJson())
    );


    if(response.statusCode == 200 && json.decode(utf8.decode(response.bodyBytes))["data"] != null){
      return ProtectedDealByGetterResponse.fromJson(json.decode(utf8.decode(response.bodyBytes))["data"]);
    }
    return null;

  }

  /**
   * 안전 거래 시작 API (Provider 가 사용)
   */
  Future<bool> startDeal(
      ProtectedDealGeneratorRequest dealGeneratorRequest) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String accessToken = await prefs.getString("access_token")!;
    Response response = await http.post(
      Uri.parse(ApiUrls.DEAL_START_URL),
      headers: {
        'Authorization': 'Bearer ${accessToken}',
        'Content-Type': 'application/json',
      },
      body: json.encode(dealGeneratorRequest.toJson()),
    );
    // 서버 응답 출력
    print(utf8.decode(response.bodyBytes));

    if (response.statusCode == 200) {
      return true;
    }

    return false;
  }

  /**
   * 입금 신청 API (Getter 가 사용)
   */
  Future<bool> requestDepositByGetter(
      int dealId) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String accessToken = await prefs.getString("access_token")!;
    Response response = await http.post(
      Uri.parse(ApiUrls.DEAL_REQUEST_DEPOSIT_URL + dealId.toString()),
      headers: {
        'Authorization': 'Bearer ${accessToken}',
        'Content-Type': 'application/json',
      },
    );
    // 서버 응답 출력

    if (response.statusCode == 200) {
      return true;
    }

    return false;
  }

  /**
   * 거래 완료 신청 API (GETTER 가 사용)
   */
  Future<bool> requestDealFinish(
      int dealId) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String accessToken = await prefs.getString("access_token")!;
    Response response = await http.patch(
      Uri.parse(ApiUrls.DEAL_REQUEST_FINISH_URL + dealId.toString()),
      headers: {
        'Authorization': 'Bearer ${accessToken}',
        'Content-Type': 'application/json',
      },
    );
    // 서버 응답 출력

    if (response.statusCode == 200) {
      return true;
    }

    return false;
  }




}
