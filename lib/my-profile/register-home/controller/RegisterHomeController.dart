
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';

class RegisterHomeController extends GetxController {
  Rx<bool> _isRegisterImage = false.obs;

  Rx<bool> _isAllInputAddress = true.obs;

  Rx<bool> _isRentType = true.obs;
  Rx<bool> _isShareRoomType = false.obs;

  TextEditingController _cityController = TextEditingController();
  TextEditingController _detailAddressController = TextEditingController();
  TextEditingController _streetNameController = TextEditingController();
  TextEditingController _streetCodeController = TextEditingController();
  TextEditingController _postCodeController = TextEditingController();

  TextEditingController _depositController = TextEditingController();
  TextEditingController _bedRoomCountController = TextEditingController();
  TextEditingController _bathRoomCountController = TextEditingController();
  TextEditingController _bill = TextEditingController();
  TextEditingController _shortIntroduceController = TextEditingController();
  TextEditingController _introduceController = TextEditingController();

  Rx<String> _selectedState = "ACT".obs;

  String get selectedState => _selectedState.value;

  void selectState(String value) {
    _selectedState.value = value;
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


  TextEditingController get streetNameController => _streetNameController;

  TextEditingController get cityController => _cityController;

  TextEditingController get detailAddressController => _detailAddressController;

  void registerImage(){
    _isRegisterImage.value = !_isRegisterImage.value;
  }




  TextEditingController get depositController => _depositController;

  bool get isAllInputAddress => _isAllInputAddress.value;

  bool get isRegisterImage => _isRegisterImage.value;

  TextEditingController get streetCodeController => _streetCodeController;

  TextEditingController get postCodeController => _postCodeController;

  TextEditingController get bedRoomCountController => _bedRoomCountController;

  TextEditingController get bathRoomCountController => _bathRoomCountController;

  TextEditingController get bill => _bill;

  TextEditingController get shortIntroduceController =>
      _shortIntroduceController;

  TextEditingController get introduceController => _introduceController;

  bool get isShareRoomType => _isShareRoomType.value;

  bool get isRentType => _isRentType.value;
}