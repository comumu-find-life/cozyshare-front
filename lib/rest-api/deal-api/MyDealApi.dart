import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:home_and_job/model/home/enums/HomeStatus.dart';
import 'package:home_and_job/model/home/request/HomeAddressGeneratorRequest.dart';
import 'package:home_and_job/model/home/request/HomeGeneratorRequest.dart';
import 'package:home_and_job/model/home/response/HomeOverviewResponse.dart';
import 'package:home_and_job/model/home/response/LatLng.dart';
import 'package:home_and_job/model/user/request/SignupRequest.dart';
import 'package:home_and_job/utils/DiskDatabase.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyDealApi {
  static String ROOT_URL = dotenv.get("ROOT_API_URL");
  static String LOAD_MY_DEALS = ROOT_URL + "";
}