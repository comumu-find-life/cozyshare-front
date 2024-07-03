import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:home_and_job/model/home/request/HomeAddressGeneratorRequest.dart';
import 'package:home_and_job/model/home/request/HomeGeneratorRequest.dart';
import 'package:home_and_job/model/home/response/LatLng.dart';
import 'package:home_and_job/model/user/request/SignupRequest.dart';
import 'package:home_and_job/utils/DiskDatabase.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeRegisterApi {
  static String ROOT_URL = dotenv.get("ROOT_API_URL");
  final String VALIDATE_ADDRESS_URL = ROOT_URL + "homes/address/validate";
  final String SAVE_HOME_URL = ROOT_URL + "homes";

  Future<CustomLatLng?> validateLatLng(
      HomeAddressGeneratorRequest homeAddressGeneratorRequest) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String accessToken = await prefs.getString("access_token")!;


    var response = await http.post(
        Uri.parse(VALIDATE_ADDRESS_URL),
        headers: {
          'Authorization': 'Bearer $accessToken',
          'Content-Type': 'application/json',
        },
        body: json.encode(homeAddressGeneratorRequest.toJson()));


    if(response.statusCode == 200){
      return CustomLatLng.fromJson(json.decode(utf8.decode(response.bodyBytes))["data"]);
    }
    return null;
  }

  Future<bool> saveHomeApi(
      HomeGeneratorRequest homeGeneratorRequest, List<String> images) async {
    print(homeGeneratorRequest.toJson());
    String? accessToken = await DiskDatabase().getAccessToken();
    var imageFiles = <http.MultipartFile>[];

    // 각 이미지를 MultipartFile로 변환하여 리스트에 추가
    for (var imagePath in images) {
      var file = await http.MultipartFile.fromPath(
        'images',
        imagePath,
        contentType: MediaType('image', 'jpeg'), // 파일 타입 지정 (이미지인 경우)
      );
      imageFiles.add(file);
    }

    // JSON 데이터를 MultipartFile로 변환
    var jsonPart = http.MultipartFile.fromString(
      'homeCreateDto',
      json.encode(homeGeneratorRequest.toJson()),
      contentType: MediaType('application', 'json'), // JSON 타입 지정
    );

    // 폼 데이터 생성
    var formData = http.MultipartRequest(
        'POST', Uri.parse(SAVE_HOME_URL));
    formData.headers['Authorization'] = 'Bearer $accessToken';
    // 파일 및 JSON 데이터 추가
    for (var file in imageFiles) {
      formData.files.add(file);
    }
    formData.files.add(jsonPart);

    // API 호출
    try {
      var response = await formData.send();

      if (response.statusCode == 200) {
        // API 호출 성공
        return true;
      } else {
        // API 호출 실패
        return false;
      }
    } catch (e) {
      // 오류 발생
      print('Error occurred: $e');
      return false;
    }
  }
}
