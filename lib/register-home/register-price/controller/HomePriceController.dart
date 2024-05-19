
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class HomePriceController extends GetxController{
  //집 가격
  TextEditingController _bondController = TextEditingController();
  TextEditingController _rentController = TextEditingController();
  TextEditingController _bill = TextEditingController();

  Rx<bool> _isAllInputPrice = false.obs;

  void validateAllInput(){
    if(_bondController.text != ""
        && _rentController.text != ""
        && _bill.text != ""
    ){
      _isAllInputPrice.value = true;
    }
  }

  bool get isAppInputPrice => _isAllInputPrice.value;

  TextEditingController get bondController => _bondController;

  TextEditingController get bill => _bill;

  TextEditingController get rentController => _rentController;
}