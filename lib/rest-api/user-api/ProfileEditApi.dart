
import 'dart:convert';

import 'package:get/get_connect/http/src/response/response.dart';
import 'package:home_and_job/utils/ApiUrls.dart';

import 'package:http/http.dart' as http;
import '../../model/user/request/UserProfileUpdateRequest.dart';
import '../../utils/DiskDatabase.dart';
import '../../utils/RestApiUtils.dart';

class ProfileEditApi {

  final RestApiUtils apiUtils = RestApiUtils();

  Future<bool> editProfileInformation(UserProfileUpdateRequest userProfileUpdateRequest) async{
    String? accessToken = await DiskDatabase().getAccessToken();
    var response = await apiUtils.patchWithBodyResponse(ApiUrls.USER_PROFILE_EDIT_URL, userProfileUpdateRequest, accessToken: accessToken);
    print(utf8.decode(response.bodyBytes));
    return apiUtils.isValidResponse(response);
  }

  Future<bool> editProfileImage(int userId, String imagePath) async {
    String? accessToken = await DiskDatabase().getAccessToken();
    var url = ApiUrls.USER_PROFILE_IMAGE_EDIT_URL.replaceAll("{userId}", userId.toString());

    // 이미지 파일을 multipart로 전송하기 위한 준비
    var request = http.MultipartRequest('PATCH', Uri.parse(url));

    // Authorization 헤더 추가
    request.headers.addAll(apiUtils.getHeaders(accessToken: accessToken));

    // 파일 추가
    request.files.add(await http.MultipartFile.fromPath('image', imagePath));

    // 요청 보내기
    var response = await request.send();

    if(response.statusCode == 200) {
      return true;
    }
    return false;
  }
}