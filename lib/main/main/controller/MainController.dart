
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:home_and_job/register-home/register-image/view/RegisterHomeImageView.dart';

import '../../../room/room-list/view/RoomListView.dart';

class MainController extends GetxController {
  Rx<bool> _selectHome = true.obs;
  Rx<bool> _selectJob = false.obs;

  void selectHotPost(int select){
    if(select == 1) {
      _selectHome.value = true;
      _selectJob.value = false;
    }

    if(select == 2) {
      _selectHome.value = false;
      _selectJob.value = true;
    }
  }

  void moveToHomeView(){
    Get.to(() => RoomListView(""));
  }

  void moveToHomeRegisterView(){
    Get.to(() => RegisterHomeImageView());
  }


  bool get selectJob => _selectJob.value;

  bool get selectHome => _selectHome.value;
}