import 'package:home_and_job/model/home/enums/HomeType.dart';

class Filter {
  List<HomeType> _type;
  int? _minRent;
  int? _maxRent;
  int? _maxBond;

  Filter({
    required List<HomeType> type,
    required int? minRent,
    required int? maxRent,
    required int? maxBond,
  })  : _type = type,
        _minRent = minRent,
        _maxRent = maxRent,
        _maxBond = maxBond;

  // Getter methods
  List<HomeType>? get type => _type;
  int? get minRent => _minRent;
  int? get maxRent => _maxRent;
  int? get maxBond => _maxBond;
}
