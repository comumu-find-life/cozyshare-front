

import 'package:get/get.dart';

class ChatDetailController extends GetxController{
  Rx<bool> _isProvider = true.obs;

  void checkUserRole(){
    //자신의 userId 와 homeId 에 있는 userId 가 일치하면 provider true
  }

  bool get isProvider => _isProvider.value;
}