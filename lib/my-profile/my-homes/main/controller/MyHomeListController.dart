
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:home_and_job/model/home/enums/HomeStatus.dart';
import 'package:home_and_job/my-profile/my-homes/api/MyHomeApi.dart';

import '../../../../model/home/response/HomeOverviewResponse.dart';
import '../../edit-home/detail-view/view/FinishView.dart';

class MyHomeListController extends GetxController {
  RxList _myHomes = [].obs;
  List<HomeOverviewResponse> _forSaleHomes = []; // 판매중인 집
  List<HomeOverviewResponse> _soldOutHomes = []; // 판매완료된 집
  List<HomeOverviewResponse> _sellStopHomes = []; //판매중단된 줍
  Rx<HomeStatus> _homeStatus = HomeStatus.FOR_SALE.obs;

  Future<bool> loadMyHomes() async{
    _forSaleHomes = [];
    _soldOutHomes = [];
    _sellStopHomes = [];
    _myHomes.value = await MyHomeApi().searchMyHomes();

    for(int i = 0; i<_myHomes.length; i++){
      if(_myHomes[i].homeStatus == HomeStatus.FOR_SALE.name) _forSaleHomes.add(_myHomes[i]);
      if(_myHomes[i].homeStatus == HomeStatus.SELL_STOP.name) _sellStopHomes.add(_myHomes[i]);
      if(_myHomes[i].homeStatus == HomeStatus.SOLD_OUT.name) _soldOutHomes.add(_myHomes[i]);
    }
    _homeStatus.value = HomeStatus.FOR_SALE;
    _myHomes.value = _forSaleHomes;
    return true;
  }

  void onTapHomeStatus(HomeStatus status){
    _homeStatus.value = status;
    if(status == HomeStatus.FOR_SALE) _myHomes.value = _forSaleHomes;
    if(status == HomeStatus.SELL_STOP) _myHomes.value = _sellStopHomes;
    if(status == HomeStatus.SOLD_OUT) _myHomes.value = _soldOutHomes;
  }

  void reupload(int homeId)async{
    bool response = await MyHomeApi().changeStatus(HomeStatus.FOR_SALE, homeId!);
    if(response){
      Get.offAll(() => FinishView("Your post has been re-uploaded!", "Touch to return to the main screen."));
    }
  }

  List get myHomes => _myHomes.value;

  HomeStatus get homeStatus => _homeStatus.value;
}