import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:http/http.dart' as http;

class SearchAddressController extends GetxController {
  String _selectCity = "";
  TextEditingController _searchController = TextEditingController();
  List<String> _addresses = [];
  RxList _filteredAddresses = [].obs;

  Future<void> searchAddresses() async {
    final apiKey = 'AIzaSyDiCJBIUrDSpEKeGIWFKC01_7-fWQhM1bg';

    final response = await http.get(Uri.parse(
        'https://maps.googleapis.com/maps/api/place/autocomplete/json?input=${_searchController.text}&types=(cities)&key=${apiKey}&region=au'));
    final data = json.decode(response.body);

    print(data);

    List<String> descriptions = [];
    for (var prediction in data['predictions']) {
      descriptions.add(prediction['description']);
    }

    for (int i = 0; i < descriptions.length; i++) {
      print(descriptions[i]);
      if (descriptions[i].contains('WA') ||
          descriptions[i].contains('NT') ||
          descriptions[i].contains('SA') ||
          descriptions[i].contains('QLD') ||
          descriptions[i].contains('NSW') ||
          descriptions[i].contains('VIC') ||
          descriptions[i].contains('TAS')) {
        if (!descriptions[i].contains("USA")) {
          if (validateDuplicateCity(descriptions[i])) {
            _filteredAddresses.add(descriptions[i]);
          }
        }
      }
    }
  }

  bool validateDuplicateCity(String city) {
    return !_filteredAddresses.contains(city);
  }

  void selectCityItem(BuildContext context, int index) {
    _selectCity = _filteredAddresses[index];
    Navigator.pop(context, _selectCity);
  }

  void filterAddresses(String query) {
    _filteredAddresses.value = _addresses
        .where((address) => address.toLowerCase().contains(query.toLowerCase()))
        .toList();
  }

  TextEditingController get searchController => _searchController;

  String get selectCity => _selectCity;

  List get filteredAddresses => _filteredAddresses.value;

  List<String> get addresses => _addresses;
}
