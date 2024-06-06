import 'package:flutter/material.dart';

enum HomeOptionType {
  A_C,
  CHAIR,
  DESK,
  WASHER,
  TV,
  LAMP,


}

String parseHomeTypeString(List<HomeOptionType> _selectedOptions) {
  return _selectedOptions.map((option) => option.toString().split('.').last).join(',');
}

extension FurnitureTypeExtension on HomeOptionType {
  IconData get icon {
    switch (this) {
      case HomeOptionType.A_C:
        return Icons.air_outlined;
      case HomeOptionType.CHAIR:
        return Icons.chair_outlined;
      case HomeOptionType.DESK:
        return Icons.desk;
      case HomeOptionType.WASHER:
        return Icons.local_laundry_service;
      case HomeOptionType.TV:
        return Icons.tv_outlined;
      case HomeOptionType.LAMP:
        return Icons.lightbulb_outline;
      default:
        return Icons.error; // 에러 처리
    }
  }

  String get text {
    switch (this) {
      case HomeOptionType.A_C:
        return "A/C";
      case HomeOptionType.CHAIR:
        return "Chair";
      case HomeOptionType.DESK:
        return "Desk";
      case HomeOptionType.WASHER:
        return "Washer";
      case HomeOptionType.TV:
        return "TV";
      case HomeOptionType.LAMP:
        return "Lamp";
      default:
        return "Unknown"; // 에러 처리
    }
  }

  static HomeOptionType? fromString(String type) {
    switch (type) {
      case "A_C":
        return HomeOptionType.A_C;
      case "CHAIR":
        return HomeOptionType.CHAIR;
      case "DESK":
        return HomeOptionType.DESK;
      case "WASHER":
        return HomeOptionType.WASHER;
      case "TV":
        return HomeOptionType.TV;
      case "LAMP":
        return HomeOptionType.LAMP;
      default:
        return null; // 에러 처리
    }
  }
}

 List<HomeOptionType> parseHomeOptionTypes(String input) {
  return input.split(',').map((e) => FurnitureTypeExtension.fromString(e)!).toList();
}