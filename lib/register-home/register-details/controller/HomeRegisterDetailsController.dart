import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:home_and_job/model/home/enums/HomeType.dart';

import '../../../model/home/enums/HomeOption.dart';

class HomeRegisterDetailsController extends GetxController {
  //hometype
  Rx<bool> _isRentType = true.obs;
  Rx<bool> _isShareRoomType = false.obs;

  //gendertype
  Rx<int> _isGenderType = 1.obs;

  Rx<bool> _isNextStep = false.obs;

  TextEditingController _bedRoomCountController = TextEditingController();
  TextEditingController _bathRoomCountController = TextEditingController();

  RxList<HomeOptionType> _selectedOptions = <HomeOptionType>[].obs;

  List<HomeOptionType> get selectedOptions => _selectedOptions;

  void validateAllInput() {
    if (_bedRoomCountController.text != "" &&
        _bathRoomCountController.text != "") {
      _isNextStep.value = true;
    } else {
      _isNextStep.value = false;
    }
  }

  String parseOptions() {
    return parseHomeTypeString(_selectedOptions);
  }

  void toggleOption(HomeOptionType option) {
    if (_selectedOptions.contains(option)) {
      _selectedOptions.remove(option);
    } else {
      _selectedOptions.add(option);
    }
  }

  void selectHomeType(int type) {
    if (type == 1) {
      _isRentType.value = true;
      _isShareRoomType.value = false;
    } else {
      _isRentType.value = false;
      _isShareRoomType.value = true;
    }
  }

  void selectGenderType(int type) {
    _isGenderType.value = type;
  }

  String extrateHomeType() {
    if (_isRentType.value) {
      return HomeType.RENT.value;
    }
    return HomeType.SHARE.value;
  }

  String extractGenderType() {
    if (_isGenderType.value == 1) {
      return "MALE";
    }
    if (_isGenderType.value == 2) {
      return "FEMALE";
    }
    return "ANYTHING";
  }

  int get isGenderType => _isGenderType.value;

  bool get isNextStep => _isNextStep.value;

  TextEditingController get bedRoomCountController => _bedRoomCountController;

  bool get isShareRoomType => _isShareRoomType.value;

  bool get isRentType => _isRentType.value;

  TextEditingController get bathRoomCountController => _bathRoomCountController;
}
