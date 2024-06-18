import 'dart:async';
import 'dart:math';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:google_maps_cluster_manager/google_maps_cluster_manager.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:home_and_job/model/filter/Filter.dart';
import 'package:home_and_job/model/home/enums/HomeType.dart';
import 'package:home_and_job/search-map/api/HomeMapApi.dart';

import '../../../constants/Colors.dart';
import '../../../model/home/response/HomeOverviewResponse.dart';
import '../../../model/home/response/HomeResponse.dart';

class MainSearchController extends GetxController {
  // 검색한 city 이름
  Filter? _filter;
  Rx<String> _cityName = "".obs;
  List<HomeOverviewResponse> initHomes = [];
  //map 관련 필드
  List<HomeOverviewResponse> items = []; //todo 데이터 로딩
  Completer<GoogleMapController> _controller = Completer();
  RxList<HomeOverviewResponse?> _filterHomes = <HomeOverviewResponse>[].obs;
  late ClusterManager _manager;
  RxSet<Marker> _markers = <Marker>{}.obs;
  CameraPosition _parisCameraPosition =
      CameraPosition(target: LatLng(-33.898972, 151.155429), zoom: 14.0);

  Future<bool> initSet() async {
    items = await HomeMapApi().loadAllHomes();
    initHomes = items;
    _manager = _initClusterManager();
    return true;
  }

  void updateCity(String newCity) {
    _cityName.value = newCity;
  }

  void updateFilter(Filter updateFilter) async {
    _filter = updateFilter;
    await updateFilterItems(updateFilter);
    _manager.setItems(items);
    _manager.updateMap();
    await _manager.updateMarkers;
  }

  ClusterManager _initClusterManager() {
    return ClusterManager<HomeOverviewResponse>(items, _updateMarkers,
        extraPercent: 0.1,
        stopClusteringZoom: 20.0,
        levels: [1, 4.25, 4.75, 9.25, 10.5, 11.5, 12.0, 13.5, 14.0],
        markerBuilder: _markerBuilder);
  }

  Future<void> updateFilterItems(Filter filter) async {

    //todo 캐싱 필요


    List<HomeOverviewResponse> _response = [];
    
    for (int i = 0; i < initHomes.length; i++) {
      HomeOverviewResponse item = initHomes[i];
      //일단 type 필터만 적용 todo 금액 필터 적용
      if (applyFilter(filter, item)) {
        _response.add(item);
      }
    }
    items = _response;
  }

  bool applyFilter(Filter filter, HomeOverviewResponse home) {
    // 타입 필터가 null이 아니고 홈의 타입과 일치하지 않는 경우 걸러냅니다.
    if (filter.type != HomeType.NONE && home.type != filter.type) {
      print("FFF");
      return false; // 타입이 일치하지 않으면 걸러냅니다.
    }

    // 최소 임대료 필터가 null이 아니고 임대료가 최소 임대료보다 작은 경우 걸러냅니다.
    if (filter.minRent != null && home.rent < filter.minRent!) {
      return false; // 임대료가 최소 임대료보다 작으면 걸러냅니다.
    }

    // 최대 임대료 필터가 null이 아니고 임대료가 최대 임대료보다 큰 경우 걸러냅니다.
    if (filter.maxRent != null && home.rent > filter.maxRent!) {
      return false; // 임대료가 최대 임대료보다 크면 걸러냅니다.
    }

    // 최대 보증금 필터가 null이 아니고 보증금이 최대 보증금보다 큰 경우 걸러냅니다.
    if (filter.maxBond != null && home.bond > filter.maxBond!) {
      return false; // 보증금이 최대 보증금보다 크면 걸러냅니다.
    }

    // 모든 조건을 통과하면 해당 홈을 필터된 목록에 포함합니다.
    return true;
  }

  Future<Marker> Function(Cluster<HomeOverviewResponse>) get _markerBuilder =>
      (cluster) async {
        return Marker(
          markerId: MarkerId(cluster.getId()),
          position: cluster.location,
          infoWindow: InfoWindow(),
          onTap: () {
            cluster.items.forEach((p) => print(p));
          },
          icon: await _getMarkerBitmap(cluster.isMultiple ? 170 : 90,
              text: cluster.isMultiple ? cluster.count.toString() : "1"),
        );
      };

  //맵 초기 화면 marker 정보 가져오는 메서드
  void _updateMarkers(Set<Marker> markers) async {
    _filterHomes.value = await _getHomePlaceModel();
    this._markers.value = markers;
  }

  Future<List<HomeOverviewResponse>> _getHomePlaceModel() async {
    List<HomeOverviewResponse> answer = [];
    List<Cluster<HomeOverviewResponse>>? res =
        (await _manager.getMarkers()).cast<Cluster<HomeOverviewResponse>>();

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

  Filter? get filter => _filter;

  String get cityName => _cityName.value;

  ClusterManager get manager => _manager;

  List<HomeOverviewResponse?> get filterHomes => _filterHomes.value;

  Set<Marker> get markers => _markers.value;

  CameraPosition get parisCameraPosition => _parisCameraPosition;

  Completer<GoogleMapController> get controller => _controller;
}

// 인기 지역과 가중치
List<Map<String, dynamic>> regions = [
  {
    'name': 'Sydney',
    'latRange': [-34.0, -33.5],
    'lngRange': [150.5, 151.5],
    'weight': 0.4 // 40% 데이터
  },
  {
    'name': 'Melbourne',
    'latRange': [-38.2, -37.5],
    'lngRange': [144.5, 145.5],
    'weight': 0.3 // 30% 데이터
  },
  // 추가 지역 정의
  {
    'name': 'Other',
    'latRange': [-43.6, -10.0],
    'lngRange': [112.0, 154.0],
    'weight': 0.3 // 30% 데이터
  },
];
