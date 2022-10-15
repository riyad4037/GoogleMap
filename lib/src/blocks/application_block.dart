import 'package:flutter/cupertino.dart';
import 'package:geolocator/geolocator.dart';
import 'package:googlmap/src/service/geolocator_service.dart';

class Applicationbloc with ChangeNotifier {
  final geolocatorService = GeolocatorService();

  Position? currentLocation;

  Applicationbloc() {
    setCurrentLocation();
  }

  setCurrentLocation() async {
    currentLocation = await geolocatorService.getCurrentLocation();
    notifyListeners();
  }
}
