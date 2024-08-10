import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:home_and_job/chatting/popup/SendChatPopup.dart';
import 'package:home_and_job/model/home/response/HomeInformationResponse.dart';
import 'package:home_and_job/rest-api/home-api/RoomApi.dart';
import 'package:home_and_job/utils/DiskDatabase.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeDetailController extends GetxController {
  late HomeInformationResponse? homeInformationResponse;
  Rx<bool> _isFavorite = false.obs;

  Future<bool> loadHomeInformation(int? homeId) async {
    String? diskResponse =
        await DiskDatabase().getFavoriteHomeId(homeId.toString());

    if (diskResponse == null) {
      _isFavorite.value = false;
    } else {
      _isFavorite.value = true;
    }

    homeInformationResponse = (await RoomApi().loadRoomById(homeId!))!;

    if (homeInformationResponse != null) {
      return true;
    }
    return false;
  }

  void sendMessage(BuildContext context) async {
    TextEditingController _textController = TextEditingController();
    SendChatPopup().showDialog(
        context,
        _textController,
        homeInformationResponse!.homeId!,
        int.parse(homeInformationResponse!.providerId!));
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
    if (_isFavorite.value == false) {
      await DiskDatabase().addFavoriteHomeId(homeId.toString());
      _isFavorite.value = true;
    } else {
      await DiskDatabase().removeFavoriteHomeId(homeId.toString());
      _isFavorite.value = false;
    }
  }

  bool get isFavorite => _isFavorite.value;
}
