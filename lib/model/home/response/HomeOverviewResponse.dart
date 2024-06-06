import 'package:google_maps_cluster_manager/google_maps_cluster_manager.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

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
  final String type;
  final int userId;
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
    required this.userId,
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
      type: json['type'] as String,
      userId: json['userId'] as int,
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
      'type': type,
      'userId': userId,
      'userName': userName,
    };
  }

  @override
  LatLng get location => LatLng(latitude, longitude);
}
