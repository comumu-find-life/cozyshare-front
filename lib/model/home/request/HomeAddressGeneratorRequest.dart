import 'package:freezed_annotation/freezed_annotation.dart';

part 'HomeAddressGeneratorRequest.freezed.dart';
part 'HomeAddressGeneratorRequest.g.dart';

@freezed
class HomeAddressGeneratorRequest with _$HomeAddressGeneratorRequest {
  const factory HomeAddressGeneratorRequest({
    required String state,
    required String city,
    required int postCode,
    required String detailAddress,
    required String streetName,
    required String streetCode,
    required double? latitude,
    required double? longitude,
  }) = _HomeAddressGeneratorRequest;

  factory HomeAddressGeneratorRequest.fromJson(Map<String, dynamic> json) =>
      _$HomeAddressGeneratorRequestFromJson(json);

  Map<String, dynamic> toJson() => {
    'state': state,
    'city': city,
    'postCode': postCode,
    'detailAddress': detailAddress,
    'streetName': streetName,
    'streetCode': streetCode,
  };


}