import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_and_job/model/home/request/HomeAddressGeneratorRequest.dart';

import '../../../../search/search-address/model/SearchCityModel.dart';
import '../../../../search/search-address/view/SearchAddressView.dart';

class HomeAddressController extends GetxController {
  Rx<String> _cityName = "".obs;
  TextEditingController _detailAddressController = TextEditingController();
  TextEditingController _streetNameController = TextEditingController();
  TextEditingController _streetCodeController = TextEditingController();
  TextEditingController _postCodeController = TextEditingController();
  Rx<bool> _isAllInputAddress = false.obs;


  void validateAllInput() {
    if(_cityName.value != ""
        && _detailAddressController.text != ""
        && _streetNameController.text != ""
        && _streetCodeController.text != ""
        && _postCodeController.text != ""
    ){
      _isAllInputAddress.value = true;
    }

    print(_isAllInputAddress.value);
  }


  void searchCity(BuildContext context)async{
    SearchCityModel? selectedCity = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SearchAddressView(),
      ),

    );
    if (selectedCity != null) {
      // 선택한 city를 상태 업데이트 메서드를 통해 업데이트
      _cityName.value = selectedCity.cityName;
    }
    validateAllInput();
  }


  HomeAddressGeneratorRequest generateHomeAddress() {
    return HomeAddressGeneratorRequest(
        city: _cityName.value,
        postCode: int.parse(_postCodeController.text),
        detailAddress: _detailAddressController.text,
        streetName: _streetNameController.text,
        streetNumber: int.parse(_streetCodeController.text));
  }

  bool get isAllInputAddress => _isAllInputAddress.value;

  TextEditingController get streetNameController => _streetNameController;

  String get cityName => _cityName.value;

  TextEditingController get detailAddressController => _detailAddressController;

  TextEditingController get streetCodeController => _streetCodeController;

  TextEditingController get postCodeController => _postCodeController;
}
