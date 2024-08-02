
import 'package:get/get.dart';
import 'package:home_and_job/model/home/response/HomeInformationResponse.dart';

import '../../../../rest-api/home-api/RoomApi.dart';

class MyHomeDetailController extends GetxController{
  late HomeInformationResponse? homeInformationResponse;

  Future<bool> loadHomeInformation(int? homeId) async{

    homeInformationResponse = (await RoomApi().loadRoomById(homeId!))!;

    if(homeInformationResponse != null){
      return true;
    }
    return false;
  }

}