import 'package:home_and_job/model/home/enums/HomeType.dart';
import 'package:home_and_job/model/user/enums/Gender.dart';

import 'HomeAddressGeneratorRequest.dart';

class HomeUpdateRequest {
  final int? homeId;
  final HomeAddressGeneratorRequest? homeAddress;
  final int? bathRoomCount;
  final bool? dealSavable;
  final int? bedroomCount;
  final int? bond;
  final Gender? gender;
  final HomeType? type;
  final String? introduce;
  final int? bill;
  final int? rent;
  final String? options;


  HomeUpdateRequest({
    required this.homeId,
    required this.homeAddress,
    required this.bathRoomCount,
    required this.dealSavable,
    required this.bedroomCount,
    required this.bond,
    required this.gender,
    required this.type,
    required this.introduce,
    required this.bill,
    required this.rent,
    required this.options,
  });

  // factory HomeUpdateRequest.fromJson(Map<String, dynamic> json) {
  //   return HomeUpdateRequest(
  //     homeId: json['homeId'] as int?,
  //     homeAddress: json['homeAddress'] != null
  //         ? HomeAddressGeneratorRequest.fromJson(
  //         json['homeAddress'] as Map<String, dynamic>)
  //         : null,
  //     bathRoomCount: json['bathRoomCount'] as int?,
  //     dealSavable: json['dealSavable'] as bool?,
  //     bedroomCount: json['bedroomCount'] as int?,
  //     bond: json['bond'] as int?,
  //     gender: json['gender'] as Gender?,
  //     type: json['type'] as String?,
  //     introduce: json['introduce'] as String?,
  //     bill: json['bill'] as int?,
  //     rent: json['rent'] as int?,
  //     options: json['options'] as String?,
  //   );
  // }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['homeId'] = homeId;
    data['homeAddress'] = homeAddress?.toJson();
    data['bathRoomCount'] = bathRoomCount;
    data['dealSavable'] = dealSavable;
    data['bedroomCount'] = bedroomCount;
    data['bond'] = bond;
    data['gender'] = gender?.name;
    data['type'] = type?.name;
    data['introduce'] = introduce;
    data['bill'] = bill;
    data['rent'] = rent;
    data['options'] = options;
    return data;
  }
}
