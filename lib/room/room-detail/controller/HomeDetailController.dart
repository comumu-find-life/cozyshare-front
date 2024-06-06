import 'package:get/get.dart';
import 'package:home_and_job/model/home/response/HomeInformationResponse.dart';
import 'package:home_and_job/room/api/RoomApi.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeDetailController extends GetxController {
  late HomeInformationResponse? homeInformationResponse;
  Rx<bool> _isFavorite = false.obs;


  // HomeDetailController(int? homeId) {
  //   checkFacorite(homeId);
  // }

  Future<bool> loadHomeInformation(int? homeId) async{
    homeInformationResponse = (await RoomApi().findById(homeId!))!;

    if(homeInformationResponse != null){
      return true;
    }
    return false;
  }

  void checkFacorite(int? homeId) async {
    final prefs = await SharedPreferences.getInstance();
    List<String>? stringList = prefs.getStringList("homeId");
    if (stringList!.contains(homeId.toString())) {
      _isFavorite?.value = true;
    } else {
      _isFavorite?.value = false;
    }
    print(stringList);
  }

  void ontapFavorite(int? homeId) async {
    final prefs = await SharedPreferences.getInstance();
    List<String>? stringList = prefs.getStringList("homeId");

    if (stringList == null) {
      // stringList가 비어있는 경우 새로운 리스트를 만들어 homeId를 추가합니다.
      prefs.setStringList("homeId", [homeId.toString()]);
    } else {
      // stringList가 비어있지 않으면 homeId가 이미 있는지 확인하고 값을 추가하거나 제거합니다.
      if (stringList.contains(homeId.toString())) {
        // 이미 있는 경우, 제거합니다.
        stringList.remove(homeId.toString());
      } else {
        // 없는 경우, 값을 추가합니다.
        stringList.add(homeId.toString());
      }
      // 변경된 stringList를 다시 저장합니다.
      prefs.setStringList("homeId", stringList);
    }

    _isFavorite.value = !_isFavorite.value;
  }

  bool get isFavorite => _isFavorite.value;
}
