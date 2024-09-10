import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:home_and_job/model/home/response/HomeOverviewResponse.dart';
import 'package:home_and_job/rest-api/home-api/RoomApi.dart';

import '../../../model/filter/Filter.dart';

class RoomListController extends GetxController {
  Rxn<Filter> saveFilter = Rxn<Filter>();

  // 필터, city 정보 둘다 없을때 초기 데이터 넣는 리스트
  RxList<HomeOverviewResponse> homes = <HomeOverviewResponse>[].obs;

  // city 정보로 조회했을때 데이터 넣는 리스트
  RxList<HomeOverviewResponse> filterCityHomes = <HomeOverviewResponse>[].obs;

  // 펄터 정보가 있을때 데이터 넣는 리스트
  RxList<HomeOverviewResponse> filterHomes = <HomeOverviewResponse>[].obs;

  Rx<String> _cityName = "".obs;
  Rx<bool> _selectRentHome = true.obs;
  Rx<bool> _selectShareHome = false.obs;

  List<HomeOverviewResponse> getFilteredHomes() {
    if (filterHomes.isNotEmpty) {
      return filterHomes;
    } else if (_cityName.isNotEmpty) {
      return filterCityHomes;
    } else {
      return homes;
    }
  }

  TextEditingController _searchController = TextEditingController();

  Future<bool> loadAllHomes(String cityName) async {
    homes.value = await RoomApi().loadAllRooms();
    if (cityName != "") {
      updateCityName(cityName);
    }
    return true;
  }

  //city 이름으로 검색
  void updateCityName(String newCity) {
    filterCityHomes.value = [];
    _cityName.value = newCity;
    for (int i = 0; i < homes.length; i++) {
      if (homes[i].containCityName(_cityName.value)) {
        filterCityHomes.add(homes[i]);
      }
    }

    print("0000");
    print(homes);
  }

  //필터 적용
  void updateFilter(Filter filter) {
    filterHomes.value = [];

    saveFilter.value = filter;

    if (filterCityHomes.length != 0) {
      for (int i = 0; i < filterCityHomes.length; i++) {
        if (filterCityHomes[i].validateFilter(filter!)) {
          filterHomes.add(filterCityHomes[i]);
        }
      }
    } else {


      for (int i = 0; i < homes.length; i++) {
        if (homes[i].validateFilter(filter!)) {
          filterHomes.add(homes[i]);
        }
      }
    }
  }

  String get cityName => _cityName.value;

  TextEditingController get searchController => _searchController;

  bool get selectShareHome => _selectShareHome.value;

  bool get selectRentHome => _selectRentHome.value;
}
