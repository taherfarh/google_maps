import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class CustomeGoogle extends StatefulWidget {
  const CustomeGoogle({super.key});

  @override
  State<CustomeGoogle> createState() => _CustomeGoogleState();
}

class _CustomeGoogleState extends State<CustomeGoogle> {
  late CameraPosition initial_camera_position;

  @override
  void initState() {
    initial_camera_position = CameraPosition(
        target: LatLng(31.41301476647367, 31.677910149184807), zoom: 13);

    initMapStyle();
    super.initState();
  }

  late GoogleMapController googleMapController;
  @override
  void dispose() {
    googleMapController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GoogleMap(
            onMapCreated: (controller) {
              googleMapController = controller;
              initMapStyle();
            },

            // cameraTargetBounds: CameraTargetBounds(LatLngBounds(
            //     southwest: LatLng(31.353018081320048, 31.570846010512184),
            //     northeast: LatLng(31.491936310063675, 31.772071686530218))),
            initialCameraPosition: initial_camera_position),
        Positioned(
          child: ElevatedButton(
              onPressed: () {
                googleMapController.animateCamera(CameraUpdate.newLatLng(
                    LatLng(30.028200965047944, 30.981446645114506)));
              },
              child: Text("Change Location")),
          left: 20,
          right: 20,
          bottom: 20,
        )
      ],
    );
  }

  void initMapStyle() async {
    var night_style = await DefaultAssetBundle.of(context)
        .loadString("assets/map_style/night_style.json");

    googleMapController.setMapStyle(night_style);
  }
}
