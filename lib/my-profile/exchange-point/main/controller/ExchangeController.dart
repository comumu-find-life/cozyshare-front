
import 'package:get/get.dart';

class ExchangeController extends GetxController{
  Rx<int> _selectType = 0.obs; // 0거래 내역, 1 출금 내역

  void ontapType(int type){
    _selectType.value = type;
  }

  int get selectType => _selectType.value;
}