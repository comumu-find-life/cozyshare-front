class HomeAddressGeneratorRequest {
  String? _city;
  int? _postCode;
  String? _detailAddress;
  String? _streetName;
  int? _streetNumber;

  HomeAddressGeneratorRequest({
    required String city,
    required int postCode,
    required String detailAddress,
    required String streetName,
    required int streetNumber,
  })   :
        _city = city,
        _postCode = postCode,
        _detailAddress = detailAddress,
        _streetName = streetName,
        _streetNumber = streetNumber;

  int? get streetNumber => _streetNumber;

  String? get streetName => _streetName;

  String? get detailAddress => _detailAddress;

  int? get postCode => _postCode;

  String? get city => _city;

}