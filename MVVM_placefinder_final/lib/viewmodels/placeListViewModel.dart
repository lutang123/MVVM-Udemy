import 'dart:core';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart' as prefix1;
import 'package:place_finder/services/webservice.dart';
import 'package:place_finder/viewmodels/placeViewModel.dart';
import 'package:map_launcher/map_launcher.dart';
import 'package:map_launcher/map_launcher.dart' as prefix0;

class PlaceListViewModel extends ChangeNotifier {
  var places = List<PlaceViewModel>();
  var mapType = prefix1.MapType.normal;

  void toggleMapType() {
    this.mapType = this.mapType == prefix1.MapType.normal
        ? prefix1.MapType.satellite
        : prefix1.MapType.normal;
    notifyListeners();
  }

  Future<void> fetchPlacesByKeywordAndPosition(
      String keyword, double latitude, double longitude) async {
    final results = await Webservice()
        .fetchPlacesByKeywordAndPosition(keyword, latitude, longitude);
    this.places = results.map((place) => PlaceViewModel(place)).toList();
    notifyListeners();
  }

  Future<void> openMapsFor(PlaceViewModel place) async {
    if (await MapLauncher.isMapAvailable(prefix0.MapType.google)) {
      await MapLauncher.launchMap(
          mapType: prefix0.MapType.google,
          coords: Coords(place.latitude, place.longitude),
          title: place.name,
          description: place.name);
    } else if (await MapLauncher.isMapAvailable(prefix0.MapType.apple)) {
      await MapLauncher.launchMap(
          mapType: prefix0.MapType.apple,
          coords: Coords(place.latitude, place.longitude),
          title: place.name,
          description: place.name);
    }
  }
}
