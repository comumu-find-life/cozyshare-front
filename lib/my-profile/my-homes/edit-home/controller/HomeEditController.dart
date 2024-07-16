import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:home_and_job/model/home/enums/HomeStatus.dart';
import 'package:home_and_job/my-profile/my-homes/api/MyHomeApi.dart';
import 'package:home_and_job/my-profile/my-homes/edit-home/detail-view/view/FinishView.dart';
import 'package:home_and_job/room/api/RoomApi.dart';

import '../../../../model/home/request/HomeAddressGeneratorRequest.dart';
import '../../../../model/home/response/HomeInformationResponse.dart';
import '../../../../model/home/response/HomeOverviewResponse.dart';
import '../../../../model/home/response/LatLng.dart';
import '../../../../register-home/api/HomeRegisterApi.dart';
import '../../../../search/search-address/model/SearchCityModel.dart';
import '../../../../search/search-address/view/SearchAddressView.dart';

class HomeEditController extends GetxController {
  late HomeInformationResponse _home;

  Rx<String> _homeAddress = "".obs;
  HomeAddressGeneratorRequest? _newAddress;
  TextEditingController _bondController = TextEditingController();
  TextEditingController _rentController = TextEditingController();
  TextEditingController _billController = TextEditingController();
  TextEditingController _introduceController = TextEditingController();

  Future<bool> loadInit(int homeIdx) async {
    _home = (await RoomApi().findById(homeIdx))!;
    _homeAddress.value = _home.address!;
    _introduceController = TextEditingController(text: _home.introduce);
    _bondController = TextEditingController(text: _home.bond.toString());
    _rentController = TextEditingController(text: _home.rent.toString());
    _billController = TextEditingController(text: _home.bill.toString());

    return true;
  }

  void soldOut() async {
    bool response =
        await MyHomeApi().changeStatus(HomeStatus.SOLD_OUT, _home.homeId!);
    if (response) {
      Get.offAll(() => FinishView("Congratulations on selling your house!",
          "Touch to return to the main screen."));
    }
  }

  void updateAddress(HomeAddressGeneratorRequest newAddress) {
    _newAddress = newAddress;
    _homeAddress.value = toAddressString(newAddress);
  }

  String toAddressString(HomeAddressGeneratorRequest addressGeneratorRequest) {
    return '${addressGeneratorRequest.streetCode} ${addressGeneratorRequest.streetName} , ${addressGeneratorRequest.city}  ${addressGeneratorRequest.state}  ${addressGeneratorRequest.postCode} ';
  }

  String get homeAddress => _homeAddress.value;

  HomeInformationResponse get home => _home;

  TextEditingController get billController => _billController;

  TextEditingController get rentController => _rentController;

  TextEditingController get bondController => _bondController;

  TextEditingController get introduceController => _introduceController;
}
