import 'package:freezed_annotation/freezed_annotation.dart';

import '../../user/enums/gender.dart';
import '../enums/HomeType.dart';
import 'HomeAddressGeneratorRequest.dart';
import 'HomeAddressGeneratorRequest.dart';

part 'HomeGeneratorRequest.freezed.dart';
part 'HomeGeneratorRequest.g.dart';

@freezed
class HomeGeneratorRequest with _$HomeGeneratorRequest {
  const factory HomeGeneratorRequest({
    required int userIdx,
    required HomeAddressGeneratorRequest homeAddress,
    required int bathRoomCount,
    required bool dealSavable,
    required int bedroomCount,
    required int bond,
    required String gender,
    required String type,
    required String introduce,
    required int bill,
    required int rent,
    required String options,
  }) = _HomeGeneratorRequest;

  factory HomeGeneratorRequest.fromJson(Map<String, dynamic> json) =>
      _$HomeGeneratorRequestFromJson(json);
}
