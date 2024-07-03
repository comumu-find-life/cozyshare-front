
import 'package:get/get.dart';
import 'package:home_and_job/model/home/response/HomeInformationResponse.dart';

import '../../../../room/api/RoomApi.dart';

class MyHomeDetailController extends GetxController{
  late HomeInformationResponse? homeInformationResponse;

  Future<bool> loadHomeInformation(int? homeId) async{

    homeInformationResponse = (await RoomApi().findById(homeId!))!;

    if(homeInformationResponse != null){
      return true;
    }
    return false;
  }

}