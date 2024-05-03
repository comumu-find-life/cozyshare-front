
import 'package:get/get.dart';

class DealRequestControllerByGetter extends GetxController{
  Rx<bool> _canNext = false.obs;

  void checkAgree(bool? value){
    _canNext.value = value!;
  }

  bool get canNext => _canNext.value;
}