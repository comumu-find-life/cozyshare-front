
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../user/enums/Gender.dart';
import '../enums/HomeType.dart';

part 'HomeInformationResponse.freezed.dart';
part 'HomeInformationResponse.g.dart';

@freezed
class HomeInformationResponse with _$HomeInformationResponse {
  const factory HomeInformationResponse({
    required String? providerId,
    required double? latitude,
    required double? longitude,
    required String? options,
    required int? bond,
    required int? residentCount,
    required int? homeId,
    required String? providerProfileUrl,
    required String? providerName,
    required String? address,
    required List<String>? images,
    required int? bill,
    required int? rent,
    required HomeType? type,
    required Gender? gender,
    required String? introduce,
    required int? bathRoomCount,
    required int? bedroomCount,
  }) = _HomeInformationResponse;

  factory HomeInformationResponse.fromJson(Map<String, dynamic> json) =>
      _$HomeInformationResponseFromJson(json);
}
