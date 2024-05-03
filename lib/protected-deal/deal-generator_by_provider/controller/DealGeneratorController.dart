
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';

class DealGeneratorController extends GetxController{

  TextEditingController _nameController = TextEditingController();
  TextEditingController _bankController = TextEditingController();
  TextEditingController _accountController = TextEditingController();
  Rx<bool> _finishAccountInformation = false.obs;

  @override
  void onInit() {
    super.onInit();
    // 각 controller의 변화를 모니터링하여 업데이트 메서드를 호출합니다.
    _nameController.addListener(update);
    _bankController.addListener(update);
    _accountController.addListener(update);
  }

  void updateAccountController() {

    // 모든 입력 칸이 채워졌는지 확인합니다.
    bool allFilled = _nameController.text.isNotEmpty &&
        _bankController.text.isNotEmpty &&
        _accountController.text.isNotEmpty;
    // _finishAccountInformation 값을 갱신합니다.
    _finishAccountInformation.value = allFilled;
    print(_finishAccountInformation.value);
  }


  bool get finishAccountInformation => _finishAccountInformation.value;

  TextEditingController get nameController => _nameController;

  TextEditingController get bankController => _bankController;

  TextEditingController get accountController => _accountController;
}