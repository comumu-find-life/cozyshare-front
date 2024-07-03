import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:home_and_job/model/home/enums/HomeType.dart';

import '../../../model/home/enums/HomeOption.dart';

class HomeRegisterDetailsController extends GetxController {
  // HomeType
  final Rx<HomeType> _selectedHomeType = HomeType.NONE.obs;

  // GenderType
  final Rx<int> _isGenderType = 1.obs;

  final Rx<bool> _isNextStep = false.obs;

  final TextEditingController _bedRoomCountController = TextEditingController();
  final TextEditingController _bathRoomCountController = TextEditingController();
  final TextEditingController _residentCountController = TextEditingController();

  final RxList<HomeOptionType> _selectedOptions = <HomeOptionType>[].obs;

  List<HomeOptionType> get selectedOptions => _selectedOptions;

  void validateAllInput() {
    _isNextStep.value = _bedRoomCountController.text.isNotEmpty && _bathRoomCountController.text.isNotEmpty && _residentCountController.text.isNotEmpty;
  }

  String parseOptions() {
    return parseHomeTypeString(_selectedOptions);
  }

  void toggleOption(HomeOptionType option) {
    _selectedOptions.contains(option) ? _selectedOptions.remove(option) : _selectedOptions.add(option);
  }

  void selectHomeType(HomeType type) {
    _selectedHomeType.value = type;
  }

  void selectGenderType(int type) {
    _isGenderType.value = type;
  }

  String extractHomeType() {
    return _selectedHomeType.value.toString().split('.').last;
  }

  String extractGenderType() {
    switch (_isGenderType.value) {
      case 1:
        return "MALE";
      case 2:
        return "FEMALE";
      default:
        return "ANYTHING";
    }
  }



  int get isGenderType => _isGenderType.value;
  bool get isNextStep => _isNextStep.value;
  TextEditingController get bedRoomCountController => _bedRoomCountController;
  TextEditingController get bathRoomCountController => _bathRoomCountController;

  TextEditingController get residentCountController => _residentCountController;

  HomeType get selectedHomeType => _selectedHomeType.value;
}
