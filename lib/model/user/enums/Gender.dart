import 'package:json_annotation/json_annotation.dart';

enum Gender {
  MALE,
  FEMALE,
  ANYTHING

  //this

}

class GenderConverter implements JsonConverter<Gender, String> {
  const GenderConverter();

  @override
  Gender fromJson(String json) {
    switch (json) {
      case 'male':
        return Gender.MALE;
      case 'female':
        return Gender.FEMALE;
      default:
        throw ArgumentError('Unknown gender: $json');
    }
  }

  @override
  String toJson(Gender gender) => gender.toString().split('.').last;
}
