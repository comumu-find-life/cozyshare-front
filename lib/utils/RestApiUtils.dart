import 'dart:convert';

import 'package:http/http.dart' as http;

class RestApiUtils {

  Map<String, String> getHeaders({String? accessToken}) {
    var headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    };
    if (accessToken != null) {
      headers['Authorization'] = 'Bearer $accessToken';
    }
    return headers;
  }

  Future<http.Response> getResponse(String url, {String? accessToken}) async {
    return await http.get(
      Uri.parse(url),
      headers: getHeaders(accessToken: accessToken),
    );
  }

  Future<http.Response> postResponse(String url, dynamic body, {String? accessToken}) async {
    return await http.post(
      Uri.parse(url),
      headers: getHeaders(accessToken: accessToken),
      body: json.encode(body),
    );
  }

  bool isValidResponse(http.Response response) {
    return response.statusCode == 200;
  }

  dynamic decodeResponse(http.Response response) {
    return json.decode(utf8.decode(response.bodyBytes))["data"];
  }
}