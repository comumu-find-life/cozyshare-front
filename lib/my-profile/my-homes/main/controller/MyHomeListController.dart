
import 'package:get/get.dart';
import 'package:home_and_job/my-profile/my-homes/api/MyHomeApi.dart';

import '../../../../model/home/response/HomeOverviewResponse.dart';

class MyHomeListController extends GetxController {
  List<HomeOverviewResponse> _myHomes = [];

  Future<bool> loadMyHomes() async{
    _myHomes = await MyHomeApi().searchMyHomes();
    return true;
  }

  List<HomeOverviewResponse> get myHomes => _myHomes;
}