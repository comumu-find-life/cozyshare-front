import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:home_and_job/search/search-address/model/SearchCityModel.dart';
import 'package:http/http.dart' as http;

class SearchAddressController extends GetxController {
  //final apiKey = 'AIzaSyDiCJBIUrDSpEKeGIWFKC01_7-fWQhM1bg';
  final apiKey = 'AIzaSyB3DctQyecPyfwMAyE7JdhgJzB_57ayoYw';
  String _selectCity = "";
  TextEditingController _searchController = TextEditingController();
  List<String> _addresses = [];
  RxList _filteredAddresses = [].obs;
  RxList _filterPlaceIds = [].obs;

  Future<void> searchAddresses() async {
    final response = await http.get(Uri.parse(
        'https://maps.googleapis.com/maps/api/place/autocomplete/json?input=${_searchController.text}&types=(cities)&key=${apiKey}&region=au'));
    final data = json.decode(response.body);


    print("0000aaaaaaa000");
    print(utf8.decode(response.bodyBytes));
    List<String> descriptions = [];
    List<String> placeIds = [];
    for (var prediction in data['predictions']) {
      descriptions.add(prediction['description']);
      placeIds.add(prediction['place_id']);
    }

    _filteredAddresses.value = [];
    _filterPlaceIds.value = [];
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
            _filterPlaceIds.add(placeIds[i]);
          }
        }
      }
    }

  }

  bool validateDuplicateCity(String city) {
    return !_filteredAddresses.contains(city);
  }

  void selectCityItem(BuildContext context, int index) async{
    _selectCity = _filteredAddresses[index];
    LatLng latLng  = await findLatlngByPlaceId(_filterPlaceIds[index]);
    Navigator.pop(context, new SearchCityModel(_selectCity, latLng));
  }

  Future<LatLng> findLatlngByPlaceId(placeId) async{
    final detailsResponse = await http.get(Uri.parse(
        'https://maps.googleapis.com/maps/api/place/details/json?place_id=${placeId}&key=${apiKey}'));
    final detailsData = json.decode(detailsResponse.body);
    final location = detailsData['result']['geometry']['location'];

    return new LatLng(location['lat'], location['lng']);
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