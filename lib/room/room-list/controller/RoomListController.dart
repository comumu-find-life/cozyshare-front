import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:home_and_job/model/home/response/HomeOverviewResponse.dart';
import 'package:home_and_job/room/api/RoomApi.dart';

class RoomListController extends GetxController {
  RxList<HomeOverviewResponse> homes = <HomeOverviewResponse>[].obs;
  RxList<HomeOverviewResponse> filterCityHomes = <HomeOverviewResponse>[].obs;

  Rx<String> _cityName = "".obs;
  Rx<bool> _selectRentHome = true.obs;
  Rx<bool> _selectShareHome = false.obs;

  TextEditingController _searchController = TextEditingController();

  Future<bool> loadAllHomes(String cityName) async {
    homes.value = await RoomApi().loadAllReward();

    if(cityName != ""){
      updateCityName(cityName);
    }
    return true;
  }


  void updateCityName(String newCity) {

    filterCityHomes.value = [];
    _cityName.value = newCity;

    for (int i = 0; i < homes.length; i++) {
      if(homes[i].containCityName(_cityName.value)){

        filterCityHomes.add(homes[i]);
      }
    }

    print(filterCityHomes.length);
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
