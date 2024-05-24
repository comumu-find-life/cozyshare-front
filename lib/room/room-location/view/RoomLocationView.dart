import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:home_and_job/constants/Colors.dart';
import 'package:home_and_job/constants/Fonts.dart';
import 'package:home_and_job/model/home/response/HomeResponse.dart';

class RoomLocationView extends StatefulWidget {
  final HomeResponse? homeResponse;

  RoomLocationView(this.homeResponse);

  @override
  State<RoomLocationView> createState() => _RoomLocationViewState();
}

class _RoomLocationViewState extends State<RoomLocationView> {
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
          title: FBoldText("Location", kTextBlackColor, 15),
        ),
        body: FutureBuilder(
          future: _createMarkerImageFromAsset(),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            if (snapshot.hasError) {
              return Text("ERROR");
            } else if (snapshot.connectionState == ConnectionState.none) {
              return Center(child: CircularProgressIndicator());
            } else {
              return GoogleMap(
                onMapCreated: (controller) {
                  mapController = controller;
                },
                initialCameraPosition: CameraPosition(
                  target: widget.homeResponse!.latLng,
                  zoom: 14,
                ),
                markers: {
                  Marker(
                    markerId: MarkerId(widget.homeResponse!.id.toString()),
                    position: widget.homeResponse!.latLng,
                    icon: markerIcon!, // Set marker icon here
                    infoWindow: InfoWindow(
                      title: widget.homeResponse!.address,
                      snippet:
                          'Rent: \$${widget.homeResponse!.rent}, Bill: \$${widget.homeResponse!.bill}, Bond: \$${widget.homeResponse!.bond}',
                    ),
                  ),
                },
              );
            }
          },
        ));
  }
}
