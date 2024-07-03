enum HomeType {
  WHOLE_PROPERTY_RENT,
  SHARED_ROOM,
  PRIVATE_ROOM,
  HOME_STAY,
  STUDIO,
  STUDENT_ACCOMMODATION,
  ONE_BED_FLAT,
  NONE
}

extension HomeTypeExtension on HomeType {
  String get value {
    switch (this) {
      case HomeType.WHOLE_PROPERTY_RENT:
        return 'Whole Property Rent';
      case HomeType.SHARED_ROOM:
        return 'Shared Room';
      case HomeType.PRIVATE_ROOM:
        return 'Private Room';
      case HomeType.HOME_STAY:
        return 'Home Stay';
      case HomeType.STUDIO:
        return 'Studio';
      case HomeType.STUDENT_ACCOMMODATION:
        return 'Student Accommodation';
      case HomeType.ONE_BED_FLAT:
        return 'One Bed Flat';
      default:
        return 'NULL';
    }
  }

  static HomeType fromString(String type) {
    switch (type) {
      case 'WHOLE_PROPERTY_RENT':
        return HomeType.WHOLE_PROPERTY_RENT;
      case 'SHARED_ROOM':
        return HomeType.SHARED_ROOM;
      case 'PRIVATE_ROOM':
        return HomeType.PRIVATE_ROOM;
      case 'HOME_STAY':
        return HomeType.HOME_STAY;
      case 'STUDIO':
        return HomeType.STUDIO;
      case 'STUDENT_ACCOMMODATION':
        return HomeType.STUDENT_ACCOMMODATION;
      case 'ONE_BED_FLAT':
        return HomeType.ONE_BED_FLAT;
      default:
        throw ArgumentError('Unknown HomeType: $type');
    }
  }
}
