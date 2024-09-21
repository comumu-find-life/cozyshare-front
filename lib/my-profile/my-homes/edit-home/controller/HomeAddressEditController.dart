import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../model/home/request/HomeAddressGeneratorRequest.dart';
import '../../../../model/home/response/LatLng.dart';
import '../../../../rest-api/home-api/HomeRegisterApi.dart';
import '../../../../search/search-address/model/SearchCityModel.dart';
import '../../../../search/search-address/view/SearchAddressView.dart';

class HomeAddressEditController extends GetxController {
  Rx<String> _cityAndState = "".obs;
  Rx<bool> _isValidateAddress = false.obs;
  double? recentLat;
  double? recentLng;
  TextEditingController _detailAddressController = TextEditingController();
  TextEditingController _streetNameController = TextEditingController();
  TextEditingController _streetCodeController = TextEditingController();
  TextEditingController _postCodeController = TextEditingController();
  Rx<bool> _isAllInputAddress = false.obs;

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

  void validateAllInput() {
    if (_cityAndState.value != "" &&
        _detailAddressController.text != "" &&
        _streetNameController.text != "" &&
        _streetCodeController.text != "" &&
        _postCodeController.text != "") {
      _isValidateAddress.value = false;
      _isAllInputAddress.value = true;
    } else {
      _isValidateAddress.value = false;
      _isAllInputAddress.value = false;
    }
  }

  void checkAddress(double lat, double lng) {
    recentLat = lat;
    recentLng = lng;
    _isValidateAddress.value = true;
  }

  Future<CustomLatLng?> validateAddress() async {
    HomeAddressGeneratorRequest addressGeneratorRequest = generateHomeAddress();
    return await HomeRegisterApi().validateLatLng(addressGeneratorRequest);
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
        state: state,
        latitude: recentLat == null ? 0 : recentLat,
        longitude: recentLng == null ? 0 : recentLng);
  }

  bool get isAllInputAddress => _isAllInputAddress.value;

  TextEditingController get postCodeController => _postCodeController;

  TextEditingController get streetCodeController => _streetCodeController;

  TextEditingController get streetNameController => _streetNameController;

  TextEditingController get detailAddressController => _detailAddressController;

  bool get isValidateAddress => _isValidateAddress.value;

  String get cityAndState => _cityAndState.value;
}
