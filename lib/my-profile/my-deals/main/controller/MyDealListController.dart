
import 'dart:async';

import 'package:get/get.dart';
import 'package:home_and_job/model/deal/enums/DealState.dart';
import 'package:home_and_job/rest-api/deal-api/MyProtectedDealApi.dart';

import '../../../../model/deal/response/ProtectedDealResponse.dart';

class MyDealListController extends GetxController{
  RxList deals = [].obs;
  RxList duringDeals = [].obs;
  RxList doneDeals = [].obs;
  RxList cancelDeals = [].obs;
  Rx<DealState> _dealStatus = DealState.REQUEST_DEAL.obs;

  void ontapState(DealState state){
    _dealStatus.value = state;
    if(_dealStatus == DealState.COMPLETE_DEAL) deals.value = doneDeals;
    if(_dealStatus == DealState.CANCEL_DURING_DEAL) deals.value = cancelDeals;
    if(_dealStatus != DealState.COMPLETE_DEAL) deals.value = duringDeals;
  }


  Future<bool> loadInit() async{
    deals.value = (await MyProtectedDealApi().loadMyDeals())!;
    for(int i = 0; i < deals.length; i++) {
      if(deals[i].dealState == DealState.COMPLETE_DEAL){
        doneDeals.add(deals[i]);
      }else if(deals[i].dealState == DealState.CANCEL_DURING_DEAL || deals[i].dealState == DealState.CANCEL_BEFORE_DEAL ){
        cancelDeals.add(deals[i]);
      }else{
        duringDeals.add(deals[i]);
      }
    }

    return true;
  }

  DealState get dealStatus => _dealStatus.value;
}