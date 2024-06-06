import 'package:get/get.dart';
import 'package:home_and_job/model/home/response/HomeInformationResponse.dart';
import 'package:home_and_job/room/room-detail/view/RoomDetailView.dart';

import '../../../model/home/response/HomeOverviewResponse.dart';

class FavoriteController extends GetxController {
  Rx<bool> _selectHome = true.obs;
  Rx<bool> _selectJob = false.obs;

  void selectType(int type) {
    if (type == 1) {
      _selectHome.value = true;
      _selectJob.value = false;
    }

    if (type == 2) {
      _selectHome.value = false;
      _selectJob.value = true;
    }
  }

  void moveHomePost(HomeInformationResponse homeInformationResponse){
    Get.to(() => RoomDetailView(homeInformationResponse.homeId));
  }

  void moveJobPost(){

  }

  bool get selectHome => _selectHome.value;

  bool get selectJob => _selectJob.value;

}
