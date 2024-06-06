
class CustomLatLng {
  late double lat;
  late double lng;

  // 생성자
  CustomLatLng({required this.lat, required this.lng});

  // fromJson 메서드
  factory CustomLatLng.fromJson(Map<String, dynamic> json) {
    return CustomLatLng(
      lat: json['lat'],
      lng: json['lng'],
    );
  }

  // toJson 메서드
  Map<String, dynamic> toJson() {
    return {
      'lat': lat,
      'lng': lng,
    };
  }
}