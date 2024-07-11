import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';

class DealProcessControllerByGetter extends GetxController {
  Rx<bool> _canFinish = false.obs;

  // 1 = 입금 확인 중, 2= 입금 확인, 3=거래 완료

  void checkAgree(bool value){
    _canFinish.value = value;
  }



  bool get canFinish => _canFinish.value;
}
