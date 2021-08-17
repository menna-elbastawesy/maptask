import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:maptask/models/user.dart';
import 'package:maps_launcher/maps_launcher.dart';


class MapSample extends StatefulWidget {
  Geo userLocation;
  MapSample(this.userLocation);
  @override
  State<MapSample> createState() => MapSampleState();
}

class MapSampleState extends State<MapSample> {
  Completer<GoogleMapController> _controller = Completer();

  CameraPosition initLocation ;
  void initstate(){
    super.initState();
    initLocation=CameraPosition(target:
      LatLng(
          double.parse(widget.userLocation.lat),
          double.parse(widget.userLocation.lng)),
          zoom:14.4746,
    );

  }

  static final CameraPosition _kLake = CameraPosition(
      target: LatLng(37.43296265331129, -122.08832357078792),
      zoom: 19.151926040649414);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigoAccent,
        title: Text('Google Map',style: TextStyle(color: Colors.white),),
      ),
      body: GoogleMap(
        initialCameraPosition: initLocation,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.indigoAccent,
        onPressed:openLocation(),
        //_goToTheLake,
        label: Text('My Location In Map'),
        icon: Icon(Icons.location_city),
      ),
    );
  }
openLocation(){
    MapsLauncher.launchCoordinates(
      double.parse(widget.userLocation.lat),double.parse( widget.userLocation.lng)
    );
}
  /*Future<void> _goToTheLake() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
  }*/
}