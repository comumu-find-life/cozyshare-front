
import 'package:get/get.dart';

import '../../main/main/frame/MainFrameView.dart';


class MainLoginController extends GetxController{

  void login() {
    Get.to(() => MainFrameView(0));
  }
}