
import 'package:shared_preferences/shared_preferences.dart';

class DiskDatabase {

  static const String ACCESS_TOKEN = "access_token";
  static const String REFRESH_TOKEN = "refresh_token";
  static const String FAVORITE_HOME_IDS = "favorite_home_ids"; // 새로 추가한 상수

  Future<String?> getAccessToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(ACCESS_TOKEN);
  }

  Future<String?> getRefreshToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(REFRESH_TOKEN);
  }

  Future<void> setAccessToken(String token) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(ACCESS_TOKEN, token);
  }

  Future<void> setRefreshToken(String token) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(REFRESH_TOKEN, token);
  }

  Future<List<String>> getAllFavoriteHomeIds() async { // 변경: 단일 homeId가 아니라 모든 homeIds를 반환하도록 변경
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getStringList(FAVORITE_HOME_IDS) ?? []; // 기본값으로 빈 리스트를 반환하도록 설정
  }

  Future<String?> getFavoriteHomeId(String homeId) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final List<String> homeIds = prefs.getStringList(FAVORITE_HOME_IDS) ?? [];
    if (homeIds.contains(homeId)) {
      return homeId;
    } else {
      return null;
    }
  }

  Future<void> addFavoriteHomeId(String homeId) async { // 변경: 단일 homeId를 추가하도록 변경
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> homeIds = await getAllFavoriteHomeIds(); // 기존 homeIds를 가져옴
    homeIds.add(homeId); // 새로운 homeId를 리스트에 추가
    await prefs.setStringList(FAVORITE_HOME_IDS, homeIds); // 업데이트된 homeIds를 저장
  }

  Future<void> removeFavoriteHomeId(String homeId) async { // 변경: 단일 homeId를 제거하도록 변경
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> homeIds = await getAllFavoriteHomeIds(); // 기존 homeIds를 가져옴
    homeIds.remove(homeId); // homeId를 리스트에서 제거
    await prefs.setStringList(FAVORITE_HOME_IDS, homeIds); // 업데이트된 homeIds를 저장
  }
}