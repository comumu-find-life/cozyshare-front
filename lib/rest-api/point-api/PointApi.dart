
import 'dart:convert';

import 'package:home_and_job/utils/ApiUrls.dart';

import '../../model/point/request/PaymentRequest.dart';
import '../../utils/DiskDatabase.dart';
import '../../utils/RestApiUtils.dart';

class PointApi{

  final RestApiUtils apiUtils = RestApiUtils();


  Future<bool> chargePointByPaypal(PaymentRequest request)async{
    var accessToken = await DiskDatabase().getAccessToken();

    var response = await apiUtils.postResponse(ApiUrls.CHARGE_POINT_BY_PAYPAL, request,
        accessToken: accessToken);

    if (apiUtils.isValidResponse(response)) {
      return true;
    }
    return false;
  }


}