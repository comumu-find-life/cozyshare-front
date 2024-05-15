import 'package:get/get.dart';
import 'package:home_and_job/register-home/register-address/controller/HomeAddressController.dart';
import 'package:home_and_job/register-home/register-image/controller/RegisterImageController.dart';
import 'package:home_and_job/register-home/register-price/controller/HomePriceController.dart';

import '../../model/home/request/HomeGeneratorRequest.dart';
import '../register-details/controller/HomeRegisterDetailsController.dart';

class HomeRegisterTotalController extends GetxController {
  HomeAddressController _homeAddressController = HomeAddressController();
  HomeRegisterDetailsController _homeRegisterDetailsController =
  HomeRegisterDetailsController();
  HomeImageController _homeImageController = HomeImageController();
  HomePriceController _homePriceController = HomePriceController();

  HomeAddressController get homeAddressController => _homeAddressController;

  HomeRegisterDetailsController get homeRegisterDetailsController =>
      _homeRegisterDetailsController;

  HomeImageController get homeImageController => _homeImageController;

  HomePriceController get homePriceController => _homePriceController;

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
}
