import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'main.dart';





class MapSample extends StatefulWidget {

  @override
  State<MapSample> createState() => MapSampleState();
}

class MapSampleState extends State<MapSample> {
  Completer<GoogleMapController> _controller = Completer();

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(30.033333, 31.233334),
    zoom: 11.4746,
  );



  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: GoogleMap(
        mapType: MapType.hybrid,
        initialCameraPosition: _kGooglePlex,
        markers: {
          Marker(
            markerId: MarkerId('1'),

            position: LatLng(30.033333, 31.233334),
            icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRose),
            infoWindow: InfoWindow(snippet: 'hello'),

          ),
          Marker(
            markerId: MarkerId('2'),

            position: LatLng(30.033333, 31.263334),
            icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueViolet),
            infoWindow: InfoWindow(
                title: "2",
                snippet: 'hello'),

          ),
          Marker(
            markerId: MarkerId('3'),

            position: LatLng(30.033333, 31.293334),
            icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueCyan),
            infoWindow: InfoWindow(
                title: "3",
                snippet: 'hello'),

          ),

        },
        polylines: {
          Polyline(
            polylineId:PolylineId('1'),
          points: [LatLng(30.033333, 31.233334),LatLng(30.033333, 31.263334),LatLng(30.033333, 31.293334),],
            color: Colors.lightGreenAccent,
            width: 2,


          )

        },
        polygons: {
          Polygon(polygonId: PolygonId('2'), points: [LatLng(30.033333, 31.233334),LatLng(30.033333, 31.263334),LatLng(30.033333, 31.293334),],
            fillColor: Colors.black,
            strokeWidth: 3,
          )
        },
        zoomControlsEnabled: false,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),

    );
  }


}