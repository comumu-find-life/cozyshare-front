import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:home_and_job/model/filter/Filter.dart';
import 'package:home_and_job/model/home/enums/HomeType.dart';

class FilterController extends GetxController {
  RxList<HomeType> _roomTypes = <HomeType>[].obs;
  Rx<bool> _isRightRentPrice = true.obs;
  TextEditingController _minRentController = TextEditingController();
  TextEditingController _maxRentController = TextEditingController();
  TextEditingController _maxBondController = TextEditingController();

  FilterController(Filter? _preFilter) {
    if (_preFilter != null) {
      // 타입 필드가 null이면 기본값으로 설정
      _roomTypes.value = _preFilter.type != null ? _preFilter.type! : [HomeType.WHOLE_PROPERTY_RENT];

      // 최소 임대료 필드가 null이면 기본값으로 설정
      String minRentText = _preFilter.minRent != null ? _preFilter.minRent.toString() : '';
      _minRentController.value = TextEditingValue(text: minRentText);

      // 최대 임대료 필드가 null이면 기본값으로 설정
      String maxRentText = _preFilter.maxRent != null ? _preFilter.maxRent.toString() : '';
      _maxRentController.value = TextEditingValue(text: maxRentText);

      // 최대 보증금 필드가 null이면 기본값으로 설정
      String maxBondText = _preFilter.maxBond != null ? _preFilter.maxBond.toString() : '';
      _maxBondController.value = TextEditingValue(text: maxBondText);
    }
  }

  Filter createFilter() {
    // 빈 값이 있는 경우 null로 할당하고, 그렇지 않은 경우 파싱된 정수 값을 할당합니다.
    int? minRent = _minRentController.text.isNotEmpty ? int.parse(_minRentController.text) : null;
    int? maxRent = _maxRentController.text.isNotEmpty ? int.parse(_maxRentController.text) : null;
    int? maxBond = _maxBondController.text.isNotEmpty ? int.parse(_maxBondController.text) : null;

    // 수정된 값들을 사용하여 Filter 객체를 생성하여 반환합니다.
    return Filter(type: _roomTypes.isEmpty ? [] : _roomTypes.toList(), minRent: minRent, maxRent: maxRent, maxBond: maxBond);
  }

  void ontapRoomType(HomeType type) {
    if (_roomTypes.contains(type)) {
      _roomTypes.remove(type);
    } else {
      _roomTypes.add(type);
    }
  }

  void validateRentPrice() {
    int minPrice = int.parse(_minRentController.text);
    int maxPrice = int.parse(_maxRentController.text);
    if (maxPrice < minPrice) {
      _isRightRentPrice.value = false;
    } else {
      _isRightRentPrice.value = true;
    }
  }

  TextEditingController get minRentController => _minRentController;

  bool get isRightRentPrice => _isRightRentPrice.value;

  List<HomeType> get roomTypes => _roomTypes;

  TextEditingController get maxRentController => _maxRentController;

  TextEditingController get maxBondController => _maxBondController;
}
