
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChargePointController extends GetxController{
  TextEditingController _priceController = TextEditingController();
  Rx<bool> _isNextStep1 = false.obs;

  Rx<bool> _step1 = true.obs;
  Rx<bool> _step2 = false.obs;
  Rx<bool> _step3 = false.obs;

  void validateNext1(){
    if(_priceController.text.length > 0){
      _isNextStep1.value = true;
    }else{
      _isNextStep1.value = false;
    }
  }

  void ontapStep1Next(){
    _step1.value = false;
    _step2.value = true;
    _step3.value = false;
  }

  void ontapStep2Next(){
    _step1.value = false;
    _step2.value = false;
    _step3.value = true;
  }


  bool get step1 => _step1.value;

  bool get isNextStep1 => _isNextStep1.value;

  TextEditingController get priceController => _priceController;

  bool get step2 => _step2.value;

  bool get step3 => _step3.value;
}
