import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:home_and_job/model/deal/request/ProtectedDealGeneratorRequest.dart';
import 'package:home_and_job/rest-api/deal-api/ProtectedDealApi.dart';
import 'package:home_and_job/protected-deal/deal-generator/view/DealGeneratorFinishView.dart';
import 'package:home_and_job/utils/SnackBar.dart';

import '../../../chatting/chat-detail-provider/controller/ChatProviderDetailController.dart';


class DealGeneratorController extends GetxController {
  TextEditingController _bondController = TextEditingController();
  Rx<bool> _finishAccountInformation = false.obs;
  DateTime selectDatetime = DateTime.now();

  @override
  void onInit() {
    super.onInit();

    _bondController.addListener(update);
  }



  void updateAccountController() {
    bool allFilled = bondController.text.isNotEmpty;
      _finishAccountInformation.value = allFilled;
  }

  // calculateFee: bondController의 값의 5%를 계산
  int calculateFee() {
    // bondController 값이 비어 있지 않고, 숫자 형식일 경우
    if (_bondController.text.isNotEmpty) {
      double bondAmount = double.tryParse(_bondController.text) ?? 0.0;
      return (bondAmount * 0.05).toInt(); // 5% 계산 후 정수로 반환
    }
    return 0; // bondController에 값이 없으면 0 반환
  }

  // calculateTotalPrice: bondController 값 + calculateFee의 결과값을 더한 값 계산
  int calculateTotalPrice() {
    int fee = calculateFee();
    int bondAmount = int.tryParse(_bondController.text) ?? 0;
    return bondAmount + fee;
  }

  Future<int?> createDeal(
      BuildContext context, ChatProviderDetailController _chatController) async {
    ProtectedDealGeneratorRequest protectedDealGeneratorRequest =
    ProtectedDealGeneratorRequest(
      getterId: _chatController.receiver.id,
      providerId: _chatController.sender.id,
      homeId: _chatController.home.homeId!,
      dmId: _chatController.roomId,
      deposit: int.parse(_bondController.text), dealAt: selectDatetime,
    );

    int? dealId =
    await ProtectedDealApi().startDeal(protectedDealGeneratorRequest);

    if (dealId != null) {
      Get.to(() => DealGeneratorFinishView());
      return dealId;
    } else {
      CustomSnackBar().show(context, "failed");
      return null;
    }
  }

  bool get finishAccountInformation => _finishAccountInformation.value;

  TextEditingController get bondController => _bondController;
}
