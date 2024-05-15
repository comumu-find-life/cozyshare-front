import 'package:get/get.dart';

class MainSearchController extends GetxController {

  Rx<String> _roomType = "".obs;
  Rx<String> _price = "".obs;

  Rx<bool> _isFilter = false.obs;

  void onTapFilter(){
    _isFilter.value = !_isFilter.value;
  }

  String get roomType => _roomType.value;

  String get price => _price.value;

  bool get isFilter => _isFilter.value;
}
