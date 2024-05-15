import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:home_and_job/model/home/request/HomeAddressGeneratorRequest.dart';

class HomeAddressController extends GetxController {
  TextEditingController _cityController = TextEditingController();
  TextEditingController _detailAddressController = TextEditingController();
  TextEditingController _streetNameController = TextEditingController();
  TextEditingController _streetCodeController = TextEditingController();
  TextEditingController _postCodeController = TextEditingController();
  Rx<bool> _isAllInputAddress = true.obs;

  Rx<String> _selectedState = "ACT".obs;

  String get selectedState => _selectedState.value;

  void selectState(String value) {
    _selectedState.value = value;
  }

  HomeAddressGeneratorRequest generateHomeAddress() {
    return HomeAddressGeneratorRequest(
        state: _selectedState.value,
        city: _cityController.text,
        postCode: int.parse(_postCodeController.text),
        detailAddress: _detailAddressController.text,
        streetName: _streetNameController.text,
        streetNumber: int.parse(_streetCodeController.text));
  }

  bool get isAllInputAddress => _isAllInputAddress.value;

  TextEditingController get streetNameController => _streetNameController;

  TextEditingController get cityController => _cityController;

  TextEditingController get detailAddressController => _detailAddressController;

  TextEditingController get streetCodeController => _streetCodeController;

  TextEditingController get postCodeController => _postCodeController;
}
