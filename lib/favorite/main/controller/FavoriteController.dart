import 'package:get/get.dart';
import 'package:home_and_job/rest-api/home-api/FavoriteApi.dart';
import 'package:home_and_job/model/home/response/HomeInformationResponse.dart';
import 'package:home_and_job/room/room-detail/view/RoomDetailView.dart';
import 'package:home_and_job/utils/DiskDatabase.dart';

import '../../../model/home/response/HomeOverviewResponse.dart';

class FavoriteController extends GetxController {
  List<HomeOverviewResponse> _homes = [];
  Rx<bool> _selectHome = true.obs;
  Rx<bool> _selectJob = false.obs;

  Future<bool> loadFavoriteHomes() async{
    List<String> homeIds = await DiskDatabase().getAllFavoriteHomeIds();

    _homes = await FavoriteApi().loadAllReward(homeIds);

    return true;
  }


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
    Get.to(() => RoomDetailView(homeInformationResponse.homeId!, false));
  }


  List<HomeOverviewResponse> get homes => _homes;

  bool get selectHome => _selectHome.value;

  bool get selectJob => _selectJob.value;

}
