enum HomeType {
  RENT, SHARE, NONE
}

extension HomeTypeExtension on HomeType {
  String get value {
    switch (this) {
      case HomeType.RENT:
        return 'Rent';
      case HomeType.SHARE:
        return 'Share';
      default:
        return "NULL";
    }
  }

  static HomeType fromString(String type) {
    switch (type) {
      case 'RENT':
        return HomeType.RENT;
      case 'SHARE':
        return HomeType.SHARE;
      default:
        throw ArgumentError('Unknown HomeType: $type');
    }
  }
}
