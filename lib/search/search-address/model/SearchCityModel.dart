
import 'package:google_maps_flutter/google_maps_flutter.dart';

class SearchCityModel{
  String _cityName;
  LatLng _latLng;

  SearchCityModel(this._cityName, this._latLng);

  LatLng get latLng => _latLng;

  String get cityName => _cityName;
}