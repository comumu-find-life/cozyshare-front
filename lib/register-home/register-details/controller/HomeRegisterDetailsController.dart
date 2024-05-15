
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';

import '../../../model/home/enums/HomeOption.dart';

class HomeRegisterDetailsController extends GetxController{
  Rx<bool> _isRentType = true.obs;
  Rx<bool> _isShareRoomType = false.obs;
  Rx<bool> _isNextStep = true.obs;

  TextEditingController _bedRoomCountController = TextEditingController();
  TextEditingController _bathRoomCountController = TextEditingController();
  TextEditingController _introduceController = TextEditingController();

  RxList<HomeOptionType> _selectedOptions = <HomeOptionType>[].obs;

  List<HomeOptionType> get selectedOptions => _selectedOptions;

  void toggleOption(HomeOptionType option) {
    if (_selectedOptions.contains(option)) {
      _selectedOptions.remove(option);
    } else {
      _selectedOptions.add(option);
    }
  }

  void selectHomeType(int type) {
    if(type == 1) {
      _isRentType.value = true;
      _isShareRoomType.value = false;
    }else{
      _isRentType.value = false;
      _isShareRoomType.value = true;
    }
  }


  bool get isNextStep => _isNextStep.value;

  TextEditingController get bedRoomCountController => _bedRoomCountController;

  bool get isShareRoomType => _isShareRoomType.value;

  bool get isRentType => _isRentType.value;

  TextEditingController get bathRoomCountController => _bathRoomCountController;

  TextEditingController get introduceController => _introduceController;
}