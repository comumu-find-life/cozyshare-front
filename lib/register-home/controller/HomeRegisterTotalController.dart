import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
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

  void validateIntroduce(){
    if(_introduceController.text != ""){
      _isAllInput.value = true;
    }
  }

  Rx<bool> _isAllInput = false.obs;

  HomeGeneratorRequest createHomeRequestDto() {
    return HomeGeneratorRequest(homeAddress: null,
        images: [],
        userId: null,
        roomCount: null,
        bathRoomCount: null,
        bond: null,
        bill: null,
        gender: null,
        homeType: null,
        introduce: '');
  }


  bool get isAllInput => _isAllInput.value;


  TextEditingController get introduceController => _introduceController;

  HomeAddressController get homeAddressController => _homeAddressController;

  HomeRegisterDetailsController get homeRegisterDetailsController =>
      _homeRegisterDetailsController;

  HomeImageController get homeImageController => _homeImageController;

  HomePriceController get homePriceController => _homePriceController;
}
