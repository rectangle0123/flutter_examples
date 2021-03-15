import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

/// Index
///
/// 使用パッケージ
/// - google_maps_flutter
/// - location
class Index extends StatelessWidget {
  // タイトル
  static const title = 'Google Maps & Location';

  @override
  Widget build(BuildContext context) {
    // Controller
    Completer<GoogleMapController> _controller = Completer();

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: FutureBuilder(
          future: Location().getLocation(),
          builder: (context, AsyncSnapshot<LocationData>snapshot) {
            if (snapshot.hasData) {
              return GoogleMap(
                initialCameraPosition: CameraPosition(
                  target: LatLng(
                      snapshot.data.latitude, snapshot.data.longitude),
                  zoom: 14,
                ),
                onMapCreated: (controller) => _controller.complete(controller),
              );
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}