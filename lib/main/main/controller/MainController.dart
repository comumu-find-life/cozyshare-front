
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:home_and_job/home/main/view/HomeMainView.dart';
import 'package:home_and_job/register-home/view/RegisterHomeImageView.dart';
import 'package:home_and_job/register-home/widgets/RegisterHomeImageWidget.dart';

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
    Get.to(() => HomeMainView());
  }

  void moveToHomeRegisterView(){
    Get.to(() => RegisterHomeImageView());
  }

  void moveToJobView(){
    Get.to(() => HomeMainView());
  }

  bool get selectJob => _selectJob.value;

  bool get selectHome => _selectHome.value;
}