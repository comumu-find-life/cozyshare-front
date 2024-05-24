
import 'package:home_and_job/model/home/enums/HomeType.dart';
import 'package:home_and_job/model/home/request/HomeAddressGeneratorRequest.dart';
import 'package:home_and_job/model/user/enums/Gender.dart';

class HomeGeneratorRequest{
  HomeAddressGeneratorRequest? homeAddress;
  List<String>? images;
  int? userId;
  int? roomCount;
  int? bathRoomCount;
  int? bond;
  int? bill;
  Gender? gender;
  RoomType? homeType;
  String? introduce;

  HomeGeneratorRequest({
    required this.homeAddress,
    required this.images,
    required this.userId,
    required this.roomCount,
    required this.bathRoomCount,
    required this.bond,
    required this.bill,
    required this.gender,
    required this.homeType,
    required this.introduce,
  });
}