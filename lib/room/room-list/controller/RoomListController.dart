import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';

class RoomListController extends GetxController {
  Rx<String> _cityName = "".obs;
  Rx<bool> _selectRentHome = true.obs;
  Rx<bool> _selectShareHome = false.obs;

  TextEditingController _searchController = TextEditingController();

  RoomListController(String cityName) {
    _cityName.value = cityName;
  }

  void updateCityName(String newCity) {
    _cityName.value = newCity;
  }

  void selectHomeType(int type) {
    if (type == 1) {
      _selectRentHome.value = true;
      _selectShareHome.value = false;
    }

    if (type == 2) {
      _selectRentHome.value = false;
      _selectShareHome.value = true;
    }
  }

  void search() {}

  String get cityName => _cityName.value;

  TextEditingController get searchController => _searchController;

  bool get selectShareHome => _selectShareHome.value;

  bool get selectRentHome => _selectRentHome.value;
}
