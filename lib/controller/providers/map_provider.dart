import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class MapProvider extends ChangeNotifier {
  Future<void> getCurrentLocation() async {
    var position = await Geolocator.getCurrentPosition();
  }
}
