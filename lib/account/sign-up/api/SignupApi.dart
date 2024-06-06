import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:home_and_job/model/user/request/SignupRequest.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';

class SignupApi with ChangeNotifier {
  String ROOT_URL = dotenv.get("ROOT_API_URL");

  Future<bool> signupApi(SignupRequest dto, String? imagePath) async {
    // 파일 생성
    var file = await http.MultipartFile.fromPath(
      'image',
      imagePath!,
      contentType: MediaType('image', 'jpeg'), // 파일 타입 지정 (이미지인 경우)
    );

    // JSON 데이터를 MultipartFile로 변환
    var jsonPart = http.MultipartFile.fromString(
      'dto',
      json.encode(dto.toJson()),
      contentType: MediaType('application', 'json'), // JSON 타입 지정
    );

    // 폼 데이터 생성
    var formData = http.MultipartRequest('POST', Uri.parse("http://10.0.2.2:8080/v1/api/user/sign-up"));

    // 파일 및 JSON 데이터 추가
    formData.files.add(file);
    formData.files.add(jsonPart);

    // 요청 보내기
    var response = await http.Response.fromStream(await formData.send());

    print(utf8.decode(response.bodyBytes));

    if (response.statusCode == 200) {
      // 성공 시 true 반환
      return true;
    } else {
      // 실패 시 false 반환
      return false;
    }
  }
}
