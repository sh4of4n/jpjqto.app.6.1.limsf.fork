import 'dart:async';
import 'package:geolocator/geolocator.dart';
import 'package:flutter_geocoder/geocoder.dart';
import 'package:jpj_qto/utils/local_storage.dart';

class Location {

  double? latitude;
  double? longitude;
  String? address;
  String? places;
  double distanceInMeters = 0;

  final localStorage = LocalStorage();

  Future<void> getCurrentLocation() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    latitude = position.latitude;
    longitude = position.longitude;
  }

  Future<LocationPermission> checkLocationPermission() async {
    LocationPermission permission = await Geolocator.requestPermission();

    return permission;
  }

  Future<void> getAddress(double lat, double long) async {
    final coordinates = Coordinates(lat, long);

    var addresses =
        await Geocoder.local.findAddressesFromCoordinates(coordinates);
    var first = addresses.first;

    address = first.addressLine;
    places = first.adminArea;
  }

  Future<double> getDistance({required double locLatitude, double? locLongitude}) async {
    double? savedLatitude =
        double.tryParse(await (localStorage.getUserLatitude() as FutureOr<String>));
    double? savedLongitude =
        double.tryParse(await (localStorage.getUserLongitude() as FutureOr<String>));

    double distance;

    if (locLatitude > -90 &&
        locLatitude < 90 &&
        locLongitude! > -180 &&
        locLongitude < 180) {
      distanceInMeters = Geolocator.distanceBetween(
          savedLatitude!, savedLongitude!, locLatitude, locLongitude);

      distance = distanceInMeters;

      return distance;
    }
    return 100000000.0;
  }
}
