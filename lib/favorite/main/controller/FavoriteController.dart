import 'package:get/get.dart';

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

  bool get selectHome => _selectHome.value;

  bool get selectJob => _selectJob.value;
}
