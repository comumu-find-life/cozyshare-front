
import 'package:flutter/material.dart';

enum HomeOptionType {
  A_C,
  Chair,
  Desk,
  Washer,
  TV,
  Lamp,
}

extension FurnitureTypeExtension on HomeOptionType {
  IconData get icon {
    switch (this) {
      case HomeOptionType.A_C:
        return Icons.air_outlined;
      case HomeOptionType.Chair:
        return Icons.chair_outlined;
      case HomeOptionType.Desk:
        return Icons.desk;
      case HomeOptionType.Washer:
        return Icons.local_laundry_service;
      case HomeOptionType.TV:
        return Icons.tv_outlined;
      case HomeOptionType.Lamp:
        return Icons.lightbulb_outline;
      default:
        return Icons.error; // 에러 처리
    }
  }

  String get text {
    switch (this) {
      case HomeOptionType.A_C:
        return "A/C";
      case HomeOptionType.Chair:
        return "Chair";
      case HomeOptionType.Desk:
        return "Desk";
      case HomeOptionType.Washer:
        return "Washer";
      case HomeOptionType.TV:
        return "TV";
      case HomeOptionType.Lamp:
        return "Lamp";
      default:
        return "Unknown"; // 에러 처리
    }
  }
}
