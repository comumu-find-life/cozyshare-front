import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_and_job/model/home/request/HomeAddressGeneratorRequest.dart';

import '../../../../model/home/response/LatLng.dart';
import '../../../../search/search-address/model/SearchCityModel.dart';
import '../../../../search/search-address/view/SearchAddressView.dart';
import '../../../api/HomeRegisterApi.dart';

class HomeAddressController extends GetxController {
  Rx<String> _cityAndState = "".obs;
  Rx<bool> _isValidateAddress = false.obs;


  TextEditingController _detailAddressController = TextEditingController();
  TextEditingController _streetNameController = TextEditingController();
  TextEditingController _streetCodeController = TextEditingController();
  TextEditingController _postCodeController = TextEditingController();
  Rx<bool> _isAllInputAddress = false.obs;

  void validateAllInput() {
    if (_cityAndState.value != "" &&
        _detailAddressController.text != "" &&
        _streetNameController.text != "" &&
        _streetCodeController.text != "" &&
        _postCodeController.text != "") {
      _isValidateAddress.value = false;
      _isAllInputAddress.value = true;
    }else{
      _isValidateAddress.value = false;
      _isAllInputAddress.value = false;
    }

  }

  void checkAddress(){
    _isValidateAddress.value = true;
  }

  Future<CustomLatLng?> validateAddress() async {
    HomeAddressGeneratorRequest addressGeneratorRequest = generateHomeAddress();
    return await HomeRegisterApi().validateLatLng(addressGeneratorRequest);
  }

  void searchCity(BuildContext context) async {
    SearchCityModel? selectedCity = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SearchAddressView(),
      ),
    );
    if (selectedCity != null) {
      // 선택한 city를 상태 업데이트 메서드를 통해 업데이트
      _cityAndState.value = selectedCity.cityName;
    }
    validateAllInput();
  }

  HomeAddressGeneratorRequest generateHomeAddress() {
    // 마지막 공백을 기준으로 city와 state를 나눕니다.
    int lastIndex = cityAndState.lastIndexOf(" ");
    String city = cityAndState.substring(0, lastIndex);
    String state = cityAndState.substring(lastIndex + 1);

    return HomeAddressGeneratorRequest(
        city: city,
        postCode: int.parse(_postCodeController.text),
        detailAddress: _detailAddressController.text,
        streetName: _streetNameController.text,
        streetCode: _streetCodeController.text,
        state: state);
  }

  bool get isAllInputAddress => _isAllInputAddress.value;

  TextEditingController get streetNameController => _streetNameController;

  String get cityAndState => _cityAndState.value;


  bool get isValidateAddress => _isValidateAddress.value;

  TextEditingController get detailAddressController => _detailAddressController;

  TextEditingController get streetCodeController => _streetCodeController;

  TextEditingController get postCodeController => _postCodeController;
}
