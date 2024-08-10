
import 'dart:async';

import 'package:get/get.dart';
import 'package:home_and_job/model/deal/enums/DealState.dart';

class MyDealListController extends GetxController{
  Rx<int> _dealState = 0.obs;

  void ontapState(int state){
    _dealState.value = state;
  }

  Future<bool> loadInit() async{
    
    return true;
  }

  int get dealState => _dealState.value;
}