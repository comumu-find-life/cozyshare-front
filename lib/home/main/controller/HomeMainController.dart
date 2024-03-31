import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';

class HomeMainController extends GetxController {
  Rx<bool> _selectRentHome = true.obs;
  Rx<bool> _selectShareHome = true.obs;

  TextEditingController _searchController = TextEditingController();

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

  TextEditingController get searchController => _searchController;

  bool get selectShareHome => _selectShareHome.value;

  bool get selectRentHome => _selectRentHome.value;
}
