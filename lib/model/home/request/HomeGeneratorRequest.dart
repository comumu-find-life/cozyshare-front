
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
  HomeType? homeType;
  String? introduce;
}