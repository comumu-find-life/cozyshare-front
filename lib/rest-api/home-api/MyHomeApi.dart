import 'dart:convert';
import 'package:easy_localization/easy_localization.dart';
import 'package:get/get_connect/http/src/multipart/multipart_file.dart';
import 'package:home_and_job/model/home/enums/HomeStatus.dart';
import 'package:home_and_job/model/home/request/HomeUpdateRequest.dart';
import 'package:home_and_job/model/home/response/HomeOverviewResponse.dart';
import 'package:home_and_job/utils/ApiUrls.dart';
import 'package:home_and_job/utils/DiskDatabase.dart';
import 'package:home_and_job/utils/RestApiUtils.dart';
import 'package:http/http.dart';

import '../user-api/LoginApi.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
class MyHomeApi {
  final RestApiUtils apiUtils = RestApiUtils();

  /**
   * 자신의 집 게시글 조회 API
   */
  Future<List<HomeOverviewResponse>> searchMyHomes() async {
    List<HomeOverviewResponse> homes = [];

    String? accessToken = await DiskDatabase().getAccessToken();
    String? userId = await DiskDatabase().getUserId();

    var response = await apiUtils.getResponse(ApiUrls.ROOM_MY_URL + userId!,
        accessToken: accessToken);

    try {
      apiUtils.validateToken(response);
    } catch (e){
      print("relogin");
      await LoginApi().reLogin();
    }

    if (apiUtils.isValidResponse(response)) {
      homes = List<HomeOverviewResponse>.from(json
          .decode(utf8.decode(response.bodyBytes))["data"]
          .map((x) => HomeOverviewResponse.fromJson(x)));
    }
    return homes;
  }

  /**
   * 집 게시글 수정 API
   */
  Future<bool> updateHomeInformation(
      HomeUpdateRequest homeUpdateRequest) async {
    String? accessToken = await DiskDatabase().getAccessToken();

    var response = await apiUtils.patchWithBodyResponse(
        ApiUrls.ROOM_SAVE_URL, homeUpdateRequest,
        accessToken: accessToken);

    print(utf8.decode(response.bodyBytes));
    return apiUtils.isValidResponse(response);
  }

  /**
   * 집 게시글 이미지 추가 API
   */
  Future<bool> updateHomeImages(int homeId, List<dynamic> images) async {

    String? accessToken = await DiskDatabase().getAccessToken();

    final imageFiles = await _getImageFiles(images);
    final formData = _buildMultipartRequest(homeId, imageFiles, accessToken!);

    final response = await formData.send();

    print(response);

    if(response.statusCode == 200) {
      return true;
    }
    return false;
  }

  Future<List<http.MultipartFile>> _getImageFiles(List<dynamic> images) async {
    final imageFiles = <http.MultipartFile>[];
    for (var imagePath in images) {
      var file = await http.MultipartFile.fromPath(
        'images',
        imagePath,
        contentType: MediaType('image', 'jpeg'),
      );
      imageFiles.add(file);
    }
    return imageFiles;
  }

  http.MultipartRequest _buildMultipartRequest(
      int homeId, List<http.MultipartFile> imageFiles, String accessToken) {

    // homeId 값을 URI에 반영
    var url = ApiUrls.ROOM_IMAGE_ADD_URL.replaceAll("{homeId}", homeId.toString());

    print(url);

    var formData = http.MultipartRequest('PATCH', Uri.parse(url));
    formData.headers['Authorization'] = 'Bearer $accessToken';
    formData.files.addAll(imageFiles);

    return formData;
  }

  /**
   * 집 게시글 이미지 삭제 API
   */
  Future<bool> deleteHomeImages(int homeId, List<String> deleteImageUrls) async {
    String? accessToken = await DiskDatabase().getAccessToken();

    // imageIds 파라미터를 ,로 구분된 문자열로 변환
    String imageIds = deleteImageUrls.join(',');

    // homeId를 URL에 삽입하고 쿼리 파라미터 추가
    String url = ApiUrls.ROOM_IMAGE_DELETE_URL.replaceFirst("{homeId}", homeId.toString()) + "?imageUrls=$imageIds";


    print("URL");
    print(url);
    var response = await apiUtils.deleteWithBodyResponse(
        url,
        accessToken: accessToken);
    return apiUtils.isValidResponse(response);
  }


  Future<bool> changeStatus(HomeStatus homeStatus, int homeId) async {
    String? accessToken = await DiskDatabase().getAccessToken();
    String apiUrl = ApiUrls.ROOM_STATE_CHANGE_URL + homeId.toString() +
        "/status/" + homeStatus.name;
    print(apiUrl);

    var response = await apiUtils.patchResponse(
        apiUrl, accessToken: accessToken);


    return apiUtils.isValidResponse(response);
  }
}
