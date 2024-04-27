
class HomeResponse{
  int? _id;
  String? _address;
  int? _bill;
  int? _bond;
  String? _introduce;

  HomeResponse(
      this._id, this._address, this._bill, this._bond, this._introduce);

  String? get introduce => _introduce;

  int? get bond => _bond;

  int? get bill => _bill;

  String? get address => _address;

  int? get id => _id;
}

final HomeResponse homeResponseTest1 = HomeResponse(1, "멜버른 시티 1234", 300, 2000, "소개글ㄹㄹ");
final HomeResponse homeResponseTest2 = HomeResponse(2, "시드니 시티 1234", 300, 2000, "소개글ㄹㄹ");
final HomeResponse homeResponseTest3 = HomeResponse(3, "호주 시티 1234", 300, 2000, "소개글ㄹㄹ");
final HomeResponse homeResponseTest4 = HomeResponse(4, "멜버른 시티 1234", 300, 2000, "소개글ㄹㄹ");
final HomeResponse homeResponseTest5 = HomeResponse(5, "멜버른 시티 1234", 300, 2000, "소개글ㄹㄹ");