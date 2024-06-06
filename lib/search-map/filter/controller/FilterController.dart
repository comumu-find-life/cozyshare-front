
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:home_and_job/model/filter/Filter.dart';
import 'package:home_and_job/model/home/enums/HomeType.dart';

class FilterController extends GetxController{
  Rx<HomeType> _roomType = HomeType.RENT.obs;
  Rx<bool> _isRightRentPrice = true.obs;
  TextEditingController _minRentController = TextEditingController();
  TextEditingController _maxRentController = TextEditingController();
  TextEditingController _maxBondController = TextEditingController();

  FilterController(Filter? initFilter){
    if(initFilter != null){
      _roomType.value = initFilter.type;
      _minRentController = TextEditingController(text: initFilter.minRent.toString());
      _maxRentController = TextEditingController(text: initFilter.maxRent.toString());
      _maxBondController = TextEditingController(text: initFilter.maxBond.toString());
    }
  }

  void ontapRoomType(HomeType type){
    _roomType.value = type;
  }

  void validateRentPrice(){
    int minPrice = int.parse(_minRentController.text);
    int maxPrice = int.parse(_maxRentController.text);
    if(maxPrice < minPrice){
      _isRightRentPrice.value = false;
    }

    print(_isRightRentPrice.value);
  }


  TextEditingController get minRentController => _minRentController;


  bool get isRightRentPrice => _isRightRentPrice.value;

  HomeType get roomType => _roomType.value;

  TextEditingController get maxRentController => _maxRentController;

  TextEditingController get maxBondController => _maxBondController;
}