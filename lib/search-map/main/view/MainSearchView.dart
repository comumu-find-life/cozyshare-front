import 'dart:async';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_maps_cluster_manager/google_maps_cluster_manager.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:home_and_job/chatting/chat-detail/mode/User.dart';
import 'package:home_and_job/common-widgets/app-bar/CommonAppbar.dart';
import 'package:home_and_job/constants/Colors.dart';
import 'package:home_and_job/constants/Fonts.dart';
import 'package:home_and_job/model/home/response/HomeResponse.dart';
import 'package:home_and_job/search-map/model/HomePlaceModel.dart';
import 'package:home_and_job/search-map/search-list/view/SearchListByMapView.dart';

import '../../filter/view/SearchFilterView.dart';
import '../../search-city/view/SearchCityView.dart';
import '../controller/MainSearchController.dart';

class MainSearchView extends StatefulWidget {
  const MainSearchView({super.key});

  @override
  State<MainSearchView> createState() => _MainSearchViewState();
}

class _MainSearchViewState extends State<MainSearchView> {
  MainSearchController _controller2 = MainSearchController();

  TextEditingController _addressController = TextEditingController();
  List<HomeResponse?> _filterHomes = [];

  late ClusterManager _manager;

  Completer<GoogleMapController> _controller = Completer();

  Set<Marker> markers = Set();

  @override
  void initState() {
    _manager = _initClusterManager();
    super.initState();
  }

  ClusterManager _initClusterManager() {
    return ClusterManager<HomeResponse>(items, _updateMarkers,
        markerBuilder: _markerBuilder);
  }

  void _updateMarkers(Set<Marker> markers) async {
    _filterHomes = await _getHomePlaceModel();
    //this
    setState(() {
      this.markers = markers;
    });
  }

  Future<List<HomeResponse?>> _getHomePlaceModel() async {
    List<HomeResponse?> answer = [];
    List<Cluster<HomeResponse>>? res =
        (await _manager.getMarkers()).cast<Cluster<HomeResponse>>();

    for (int i = 0; i < res.length; i++) {
      print(res[i].items.map((e) => {answer.add(e)}));
    }

    return answer;
  }


  void _showMarkerInfo(HomeResponse item) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Marker Info'),
          content: Column(
            children: [
              ListTile(
                title: Text('ID: ${item.id}'),
                subtitle: Text('Address: ${item.address}'),
                // 다른 필드도 추가 가능
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Close'),
            ),
          ],
        );
      },
    );
  }


  Future<Marker> Function(Cluster<HomeResponse>) get _markerBuilder =>
      (cluster) async {
        return Marker(
          markerId: MarkerId(cluster.getId()),
          position: cluster.location,
          infoWindow: InfoWindow(),
          onTap: () {
            if (cluster.items.length == 1) {
              _showMarkerInfo(cluster.items.first);
            } else {
              cluster.items.forEach((p) => print(p));
            }
          },
          icon: await _getMarkerBitmap(cluster.isMultiple ? 250 : 180,
              text: cluster.isMultiple ? cluster.count.toString() : "1"),
        );
      };

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


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteBackGroundColor,
      bottomSheet: _buildBottomButton(),

      body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [

              _buildInputAddress(),
              Container(
                  margin: EdgeInsets.only(top: 20.h),
                  width: 380.w,
                  height: 550.h,
                  child: GoogleMap(
                      mapType: MapType.normal,
                      initialCameraPosition: _parisCameraPosition,
                      markers: markers,
                      onMapCreated: (GoogleMapController controller) {
                        _controller.complete(controller);
                        _manager.setMapId(controller.mapId);
                      },
                      onCameraMove: _manager.onCameraMove,
                      onCameraIdle: _manager.updateMap)),
            ],
          ),),
    );
  }

  Widget _buildBottomButton() {
    return InkWell(
      onTap: () {
        Get.to(() => SearchRoomListByMapView(_filterHomes));
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 10.h),
        width: 360.w,
        height: 45.h,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(6)),
            color: kDarkBlue),
        child: Center(
          child: FBoldText("See  ${_filterHomes.length} Rooms in the Area",
              kWhiteBackGroundColor, 14),
        ),
      ),
    );
  }

  Widget _buildInputAddress() {
    return Center(
      child: Container(
        margin: EdgeInsets.only(top: 60.h),
        width: 350.w,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildTotalFilter(),
            InkWell(
              onTap: (){
                Get.to(() => SearchCityView());
              },
              child: Container(
                width: 310.w,
                height: 45.h,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    border: Border.all(color: kGrey400Color)),
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 10.w),
                      child: Icon(
                        Icons.search,
                        color: kGrey800Color,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 10.w),
                      child: FRegularText("Search City", kGrey500Color, 14),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTotalFilter() {
    return InkWell(
      onTap: () {
        Get.to(() => SearchFilterView(), transition: Transition.upToDown);
      },
      child: Container(
        height: 35.h,
        width: 35.w,
        decoration: BoxDecoration(
            border: Border.all(color: kGrey400Color),
            borderRadius: BorderRadius.all(Radius.circular(6))),
        child: Center(
          child: Icon(
            Icons.tune,
            size: 19.sp,
            color: kDarkBlue,
          ),
        ),
      ),
    );
  }

  final CameraPosition _parisCameraPosition =
      CameraPosition(target: LatLng(48.856613, 2.352222), zoom: 12.0);

  List<HomeResponse> items = [
    for (int i = 0; i < 50; i++)
      HomeResponse(
        address: "33" + i.toString() + "WAC MEL 1500",
        latLng: LatLng(48.858265 - i * 0.001, 2.350107 + i * 0.001),
        rent: 200,
        bond: 1000,
        id: 0,
        bill: 300,
        introduce: "introducee",
      ),
  ];
}
