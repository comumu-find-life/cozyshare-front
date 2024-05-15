import 'package:google_maps_cluster_manager/google_maps_cluster_manager.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomeResponse with ClusterItem {
  final int id;
  final String address;
  final int bill;
  final int rent;
  final int bond;
  final String introduce;
  final LatLng latLng;

  HomeResponse({
    required this.id,
    required this.rent,
    required this.address,
    required this.bill,
    required this.bond,
    required this.introduce,
    required this.latLng,
  });

  @override
  LatLng get location => latLng;


}

final HomeResponse homeResponseTest1 = HomeResponse(
  id: 1,
  address: "멜버른 시티 1234",
  bill: 300,
  bond: 2000,
  introduce: "소개글ㄹㄹ",
  latLng: LatLng(37.4220, -122.0841), rent: 500,
);

final HomeResponse homeResponseTest2 = HomeResponse(
  id: 2,
  address: "시드니 시티 1234",
  bill: 300,
  bond: 2000,
  introduce: "소개글ㄹㄹ",
  latLng: LatLng(37.7749, -122.4194),rent: 500,
);

final HomeResponse homeResponseTest3 = HomeResponse(
  id: 3,
  address: "호주 시티 1234",
  bill: 300,
  bond: 2000,
  introduce: "소개글ㄹㄹ",
  latLng: LatLng(34.0522, -118.2437),rent: 500,
);

final HomeResponse homeResponseTest4 = HomeResponse(
  id: 4,
  address: "멜버른 시티 1234",
  bill: 300,
  bond: 2000,
  introduce: "소개글ㄹㄹ",
  latLng: LatLng(32.7157, -117.1611),rent: 500,
);

final HomeResponse homeResponseTest5 = HomeResponse(
  id: 5,
  address: "멜버른 시티 1234",
  bill: 300,
  bond: 2000,
  introduce: "소개글ㄹㄹ",
  latLng: LatLng(34.0522, -118.2437),rent: 500,
);
