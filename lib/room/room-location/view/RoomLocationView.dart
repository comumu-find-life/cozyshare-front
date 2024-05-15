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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: FBoldText("Location", kTextBlackColor, 15),
      ),
      body: GoogleMap(
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
            infoWindow: InfoWindow(
              title: widget.homeResponse!.address,
              snippet:
              'Rent: \$${widget.homeResponse!.rent}, Bill: \$${widget.homeResponse!.bill}, Bond: \$${widget.homeResponse!.bond}',
            ),
          ),
        },
      ),
    );
  }
}
