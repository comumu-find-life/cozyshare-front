import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:home_and_job/model/deal/request/ProtectedDealGeneratorRequest.dart';
import 'package:home_and_job/protected-deal/api/ProtectedDealApi.dart';
import 'package:home_and_job/protected-deal/deal-generator/view/DealGeneratorFinishView.dart';
import 'package:home_and_job/utils/SnackBar.dart';

import '../../../chatting/chat-detail/controller/ChatDetailController.dart';

class DealGeneratorController extends GetxController {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _bankController = TextEditingController();
  TextEditingController _accountController = TextEditingController();
  TextEditingController _bondController = TextEditingController();
  Rx<bool> _finishAccountInformation = false.obs;

  @override
  void onInit() {
    super.onInit();
    // 각 controller의 변화를 모니터링하여 업데이트 메서드를 호출합니다.
    _nameController.addListener(update);
    _bondController.addListener(update);
    _bankController.addListener(update);
    _accountController.addListener(update);
  }

  void updateAccountController() {
    // 모든 입력 칸이 채워졌는지 확인합니다.
    bool allFilled = _nameController.text.isNotEmpty &&
        _bankController.text.isNotEmpty &&
        _bondController.text.isNotEmpty &&
        _accountController.text.isNotEmpty;
    // _finishAccountInformation 값을 갱신합니다.
    _finishAccountInformation.value = allFilled;
  }

  void createDeal(BuildContext context,ChatDetailController _chatController) async{
    ProtectedDealGeneratorRequest protectedDealGeneratorRequest =
        ProtectedDealGeneratorRequest(
            getterId: _chatController.receiver.id,
            providerId: _chatController.sender.id,
            homeId: _chatController.home.homeId!,
            dmId: _chatController.roomId,
            bond: int.parse(_bondController.text));
    
    bool response = await ProtectedDealApi().startDeal(protectedDealGeneratorRequest);
    if(response){
      Get.to(() => DealGeneratorFinishView());
    }else{
      CustomSnackBar().show(context, "failed");
    }
  }

  bool get finishAccountInformation => _finishAccountInformation.value;

  TextEditingController get bondController => _bondController;

  TextEditingController get nameController => _nameController;

  TextEditingController get bankController => _bankController;

  TextEditingController get accountController => _accountController;
}
