import 'dart:convert';
import 'package:flutter/widgets.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:home_and_job/model/home/request/HomeAddressGeneratorRequest.dart';
import 'package:home_and_job/model/home/request/HomeGeneratorRequest.dart';
import 'package:home_and_job/model/home/response/LatLng.dart';
import 'package:home_and_job/utils/ApiUrls.dart';
import 'package:home_and_job/utils/DiskDatabase.dart';
import 'package:home_and_job/utils/RestApiUtils.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeRegisterApi {
  final RestApiUtils apiUtils = RestApiUtils();

  Future<String?> _getAccessToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("access_token");
  }

  Future<CustomLatLng?> validateLatLng(HomeAddressGeneratorRequest request) async {
    try {
      String? accessToken = await _getAccessToken();
      if (accessToken == null) throw Exception('Access token not found');

      final response = await apiUtils.postResponse(
        ApiUrls.ROOM_ADDRESS_VALIDATE_URL,
        request.toJson(),
        accessToken: accessToken,
      );

      if (apiUtils.isValidResponse(response)) {
        return CustomLatLng.fromJson(apiUtils.decodeResponse(response));
      }
      return null;
    } catch (e) {
      
      debugPrint('Error in validateLatLng: $e');
      return null;
    }
  }

  Future<bool> saveHomeApi(HomeGeneratorRequest request, List<String> images) async {
    try {
      String? accessToken = await DiskDatabase().getAccessToken();
      if (accessToken == null) throw Exception('Access token not found');

      final imageFiles = await _getImageFiles(images);
      final jsonPart = _getJsonPart(request);

      final formData = _buildMultipartRequest(imageFiles, jsonPart, accessToken);

      final response = await formData.send();

      return response.statusCode == 200;
    } catch (e) {
      debugPrint('Error in saveHomeApi: $e');
      return false;
    }
  }

  Future<List<http.MultipartFile>> _getImageFiles(List<String> images) async {
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

  http.MultipartFile _getJsonPart(HomeGeneratorRequest request) {
    return http.MultipartFile.fromString(
      'homeGeneratorRequest',
      json.encode(request.toJson()),
      contentType: MediaType('application', 'json'),
    );
  }

  http.MultipartRequest _buildMultipartRequest(
      List<http.MultipartFile> imageFiles, http.MultipartFile jsonPart, String accessToken) {
    var formData = http.MultipartRequest('POST', Uri.parse(ApiUrls.ROOM_SAVE_URL));
    formData.headers['Authorization'] = 'Bearer $accessToken';
    formData.files.addAll(imageFiles);
    formData.files.add(jsonPart);
    return formData;
  }
}
