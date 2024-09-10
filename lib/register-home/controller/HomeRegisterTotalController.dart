import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:home_and_job/model/home/enums/HomeOption.dart';
import 'package:home_and_job/model/home/request/HomeAddressGeneratorRequest.dart';
import 'package:home_and_job/model/home/response/LatLng.dart';
import 'package:home_and_job/rest-api/home-api/HomeRegisterApi.dart';
import 'package:home_and_job/register-home/register-details/widgets/HomeOptionSelect.dart';
import 'package:home_and_job/register-home/register-image/controller/RegisterImageController.dart';
import 'package:home_and_job/register-home/register-price/controller/HomePriceController.dart';

import '../../model/home/request/HomeGeneratorRequest.dart';
import '../register-address/main/controller/HomeAddressController.dart';
import '../register-details/controller/HomeRegisterDetailsController.dart';

class HomeRegisterTotalController extends GetxController {

  HomeAddressController _homeAddressController = HomeAddressController();
  HomeRegisterDetailsController _homeRegisterDetailsController =
      HomeRegisterDetailsController();
  HomeImageController _homeImageController = HomeImageController();
  HomePriceController _homePriceController = HomePriceController();
  TextEditingController _introduceController = TextEditingController();

  void validateIntroduce() {
    if (_introduceController.text != "") {
      _isAllInput.value = true;
    }
  }

  Rx<bool> _isAllInput = false.obs;


  Future<bool> saveHome() async{
    HomeAddressGeneratorRequest generateHomeAddress =
        _homeAddressController.generateHomeAddress();


    HomeGeneratorRequest homeGeneratorRequest = HomeGeneratorRequest(
      //todo 변경
        userIdx: 3,
        homeAddress: _homeAddressController.generateHomeAddress(),
        bathRoomCount: int.parse(_homeRegisterDetailsController.bathRoomCountController.text),
        dealSavable: true,
        bedroomCount: int.parse(_homeRegisterDetailsController.bedRoomCountController.text),
        bond: int.parse(_homePriceController.bondController.text),
        gender: _homeRegisterDetailsController.extractGenderType(),
        type: _homeRegisterDetailsController.extractHomeType(),
        introduce: _introduceController.text,
        bill: int.parse(_homePriceController.bill.text),
        rent: int.parse(_homePriceController.rentController.text),
        options: _homeRegisterDetailsController.parseOptions(),
        canParking: _homeRegisterDetailsController.canParking);


    bool response = await HomeRegisterApi().saveHomeApi(homeGeneratorRequest, _homeImageController.extractImageUrls());

    return response;
  }

  bool get isAllInput => _isAllInput.value;

  TextEditingController get introduceController => _introduceController;

  HomeAddressController get homeAddressController => _homeAddressController;

  HomeRegisterDetailsController get homeRegisterDetailsController =>
      _homeRegisterDetailsController;

  HomeImageController get homeImageController => _homeImageController;

  HomePriceController get homePriceController => _homePriceController;
}
