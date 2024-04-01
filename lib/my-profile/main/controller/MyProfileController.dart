
import 'package:get/get.dart';

class MyProfileController extends GetxController {
  Rx<bool> _isProvider = true.obs;

  void changeRole() {
    _isProvider.value = !_isProvider.value;
  }

  bool get isProvider => _isProvider.value;
}