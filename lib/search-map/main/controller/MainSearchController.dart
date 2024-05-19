
import 'dart:async';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:google_maps_cluster_manager/google_maps_cluster_manager.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../constants/Colors.dart';
import '../../../model/home/response/HomeResponse.dart';

class MainSearchController extends GetxController {

  // 검색한 city 이름
  Rx<String> _cityName = "".obs;

  //map 관련 필드
  Completer<GoogleMapController> _controller = Completer();
  RxList<HomeResponse?> _filterHomes = <HomeResponse>[].obs;
  late ClusterManager _manager;
  RxSet<Marker> _markers = <Marker>{}.obs;
  CameraPosition _parisCameraPosition =
  CameraPosition(target: LatLng(-33.898972, 151.155429), zoom: 12.0);

  void updateCity(String newCity){
    _cityName.value = newCity;
  }

  void initSet(){
    _manager = _initClusterManager();
  }

  ClusterManager _initClusterManager() {
    return ClusterManager<HomeResponse>(items, _updateMarkers,
        markerBuilder: _markerBuilder);
  }

  Future<Marker> Function(Cluster<HomeResponse>) get _markerBuilder =>
          (cluster) async {
        return Marker(
          markerId: MarkerId(cluster.getId()),
          position: cluster.location,
          infoWindow: InfoWindow(),
          onTap: () {
              cluster.items.forEach((p) => print(p));
          },
          icon: await _getMarkerBitmap(cluster.isMultiple ? 200 : 120,
              text: cluster.isMultiple ? cluster.count.toString() : "1"),
        );
      };

  //맵 초기 화면 marker 정보 가져오는 메서드
  void _updateMarkers(Set<Marker> markers) async {
    _filterHomes.value = await _getHomePlaceModel();
      this._markers.value = markers;
  }

  Future<List<HomeResponse>> _getHomePlaceModel() async {
    List<HomeResponse> answer = [];
    List<Cluster<HomeResponse>>? res =
    (await _manager.getMarkers()).cast<Cluster<HomeResponse>>();

    for (int i = 0; i < res.length; i++) {
      print(res[i].items.map((e) => {answer.add(e)}));
    }
    return answer;
  }

  //마커 그리는 메서드
  Future<BitmapDescriptor> _getMarkerBitmap(int size, {String? text}) async {
    final PictureRecorder pictureRecorder = PictureRecorder();
    final Canvas canvas = Canvas(pictureRecorder);
    final Paint paint1 = Paint()
      ..color = kDarkBlue.withOpacity(0.7) // 투명도 추가
      ..style = PaintingStyle.fill; // 채우기 스타일로 설정

    final Paint paint2 = Paint()
      ..color = Colors.white // 텍스트 색상을 변경하기 위한 Paint 객체 추가
      ..style = PaintingStyle.stroke // 테두리 스타일로 설정
      ..strokeWidth = 2; // 테두리 두께 설정

    canvas.drawCircle(Offset(size / 2, size / 2), size / 2.0, paint1);

    if (text != null) {
      TextPainter painter = TextPainter(textDirection: TextDirection.ltr);
      painter.text = TextSpan(
        text: text,
        style: TextStyle(
            fontSize: size / 2.5,
            fontFamily: "FBold",
            color: Colors.white,
            fontWeight: FontWeight.normal),
      );
      painter.layout();
      painter.paint(
        canvas,
        Offset(size / 2 - painter.width / 2, size / 2 - painter.height / 2),
      );
    }

    // 테두리를 추가하기 위해 같은 위치에 동일한 크기의 원을 그리고 채우기 스타일 대신 테두리 스타일로 설정
    canvas.drawCircle(Offset(size / 2, size / 2), size / 2.0, paint2);

    final img = await pictureRecorder.endRecording().toImage(size, size);
    final data = await img.toByteData(format: ImageByteFormat.png);

    return BitmapDescriptor.fromBytes(data!.buffer.asUint8List());
  }

  // 시티 검색 후 카메라 이동 메서드
  void updateCameraPosition(LatLng latLng) async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(
      CameraPosition(target: latLng, zoom: 12.0),
    ));
  }

  List<HomeResponse> items = [
    for (int i = 0; i < 50; i++)
      HomeResponse(
        address: "33" + i.toString() + "WAC MEL 1500",
        latLng: LatLng(-33.898972 - i * 0.001, 151.155429 + i * 0.001),
        rent: 200,
        bond: 1000,
        id: 0,
        bill: 300,
        introduce: "introducee",
      ),
  ];



  String get cityName => _cityName.value;

  ClusterManager get manager => _manager;

  List<HomeResponse?> get filterHomes => _filterHomes.value;

  Set<Marker> get markers => _markers.value;

  CameraPosition get parisCameraPosition => _parisCameraPosition;

  Completer<GoogleMapController> get controller => _controller;
}
