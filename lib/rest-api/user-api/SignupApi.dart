import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:home_and_job/model/user/request/SignupRequest.dart';
import 'package:home_and_job/utils/ApiUrls.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';

class SignupApi with ChangeNotifier {

  Future<bool> signupApi(SignupRequest dto, String? imagePath) async {
    // 파일 생성
    var file = imagePath == null
        ? null
        : await http.MultipartFile.fromPath(
            'image',
            imagePath!,
            contentType: MediaType('image', 'jpeg'), // 파일 타입 지정 (이미지인 경우)
          );

    // JSON 데이터를 MultipartFile로 변환
    var jsonPart = http.MultipartFile.fromString(
      'userSignupRequest',
      json.encode(dto.toJson()),
      contentType: MediaType('application', 'json'), // JSON 타입 지정
    );

    // 폼 데이터 생성
    var formData = http.MultipartRequest('POST', Uri.parse(ApiUrls.USER_SIGN_UP_URL));

    // 파일 및 JSON 데이터 추가
    file == null ? null : formData.files.add(file!);
    formData.files.add(jsonPart);

    // 요청 보내기
    var response = await http.Response.fromStream(await formData.send());

    return response.statusCode == 200;
  }
}
