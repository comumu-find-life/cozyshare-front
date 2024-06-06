import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:home_and_job/constants/Colors.dart';
import 'package:home_and_job/constants/Fonts.dart';
import 'package:home_and_job/model/home/response/HomeOverviewResponse.dart';
import 'package:home_and_job/model/home/response/LatLng.dart';

import '../../main/controller/HomeAddressController.dart';

class AddressValidateView extends StatefulWidget {
  final CustomLatLng? location;
  final HomeAddressController _controller;

  AddressValidateView(this.location, this._controller);

  @override
  State<AddressValidateView> createState() => _RoomLocationViewState();
}

class _RoomLocationViewState extends State<AddressValidateView> {
  late GoogleMapController mapController;
  BitmapDescriptor? markerIcon;

  @override
  void initState() {
    super.initState();
    //_createMarkerImageFromAsset();
  }

  Future<bool> _createMarkerImageFromAsset() async {
    final ImageConfiguration imageConfiguration =
        createLocalImageConfiguration(context);
    await BitmapDescriptor.fromAssetImage(
            imageConfiguration, 'assets/icons/location.png')
        .then((icon) {
      setState(() {
        markerIcon = icon;
      });
    });

    return true;
  }

  @override
  Widget build(BuildContext context) {
    // Check if markerIcon is initialized, if not, set it to a default value
    if (markerIcon == null) {
      markerIcon = BitmapDescriptor.defaultMarker;
    }

    return Scaffold(
        appBar: AppBar(
          title: FBoldText("Is Right Address?", kTextBlackColor, 15),
        ),
        body: FutureBuilder(
          future: _createMarkerImageFromAsset(),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            if (snapshot.hasError) {
              return Text("ERROR");
            } else if (snapshot.connectionState == ConnectionState.none) {
              return Center(child: CircularProgressIndicator());
            } else {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      width: 380.w,
                      height: 620.h,
                      child: GoogleMap(
                        onMapCreated: (controller) {
                          mapController = controller;
                        },
                        initialCameraPosition: CameraPosition(
                          target:
                              LatLng(widget.location!.lat, widget.location!.lng),
                          zoom: 14,
                        ),
                        markers: {
                          Marker(
                            markerId: MarkerId("1"),
                            position: LatLng(
                                widget.location!.lat!, widget.location!.lng!),
                            icon: markerIcon!, // Set marker icon here
                          ),
                        },
                      ),
                    ),
                    _buildFooter(),
                  ],
                ),
              );
            }
          },
        ));
  }

  Widget _buildFooter() {
    return Container(
      margin: EdgeInsets.only(top: 20.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          InkWell(
            onTap: (){
              Navigator.pop(context);
            },
            child: Container(
              width: 130.w,
              height: 50.h,
              decoration: BoxDecoration(
                  color: kGrey300Color,
                  borderRadius: BorderRadius.all(Radius.circular(6))),
              child: Center(
                child: FBoldText("no", kWhiteBackGroundColor, 14),
              ),
            ),
          ),
          InkWell(
            onTap: (){
              widget._controller.checkAddress();
              Navigator.pop(context);
            },
            child: Container(
              margin: EdgeInsets.only(left: 5.w),
              width: 220.w,
              height: 50.h,
              decoration: BoxDecoration(
                  color: kPrimaryColor,
                  borderRadius: BorderRadius.all(Radius.circular(6))),
              child: Center(
                child: FBoldText("Yes", kWhiteBackGroundColor, 14),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
