import 'package:json_annotation/json_annotation.dart';

enum Gender {
  male,
  female,
}

class GenderConverter implements JsonConverter<Gender, String> {
  const GenderConverter();

  @override
  Gender fromJson(String json) {
    switch (json) {
      case 'male':
        return Gender.male;
      case 'female':
        return Gender.female;
      default:
        throw ArgumentError('Unknown gender: $json');
    }
  }

  @override
  String toJson(Gender gender) => gender.toString().split('.').last;
}
