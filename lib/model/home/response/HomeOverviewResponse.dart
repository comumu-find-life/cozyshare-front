import 'package:google_maps_cluster_manager/google_maps_cluster_manager.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:home_and_job/model/filter/Filter.dart';
import 'package:home_and_job/model/home/enums/HomeType.dart';

class HomeOverviewResponse with ClusterItem {
  final int id;
  final String address;
  final double latitude;
  final double longitude;
  final String mainImage;
  final int rent;
  final int bond;
  final int bill;
  final int bedroomCount;
  final int bathRoomCount;
  final HomeType type;
  final int userIdx;
  final String userName;

  HomeOverviewResponse({
    required this.id,
    required this.address,
    required this.latitude,
    required this.longitude,
    required this.mainImage,
    required this.rent,
    required this.bond,
    required this.bill,
    required this.bedroomCount,
    required this.bathRoomCount,
    required this.type,
    required this.userIdx,
    required this.userName,
  });

  bool containCityName(String cityName) {
    // Convert both address and cityName to lowercase for case-insensitive comparison
    return this.address.toLowerCase().contains(cityName.toLowerCase());
  }

  factory HomeOverviewResponse.fromJson(Map<String, dynamic> json) {
    print(json);
    return HomeOverviewResponse(
      id: json['id'] as int,
      address: json['address'] as String,
      latitude: json['latitude'] as double,
      longitude: json['longitude'] as double,
      mainImage: json['mainImage'] as String,
      rent: json['rent'] as int,
      bond: json['bond'] as int,
      bill: json['bill'] as int,
      bedroomCount: json['bedroomCount'] as int,
      bathRoomCount: json['bathRoomCount'] as int,
      type: HomeTypeExtension.fromString(json['type'] as String),
      userIdx: json['userIdx'] as int,
      userName: json['userName'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'address': address,
      'latitude': latitude,
      'longitude': longitude,
      'mainImage': mainImage,
      'rent': rent,
      'bond': bond,
      'bill': bill,
      'bedroomCount': bedroomCount,
      'bathRoomCount': bathRoomCount,
      'type': type.value,
      'userIdx': userIdx,
      'userName': userName,
    };
  }

  bool validateFilter(Filter filter) {

    if (filter.type != HomeType.NONE && filter.type != this.type) {
      return false;

    }
    if (filter.minRent != null && this.rent < filter.minRent!) {
      return false;
    }
    if (filter.maxRent != null && this.rent > filter.maxRent!) {
      return false;
    }
    if (filter.maxBond != null && this.bond > filter.maxBond!) {
      return false;
    }

    return true;
  }


  @override
  LatLng get location => LatLng(latitude, longitude);
}
