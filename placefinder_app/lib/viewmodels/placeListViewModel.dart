import 'dart:core';
import 'package:flutter/material.dart';
import 'package:placefinderapp/services/webservice.dart';
import 'package:placefinderapp/viewmodels/placeViewModel.dart';
import 'package:map_launcher/map_launcher.dart';
import 'package:map_launcher/map_launcher.dart' as prefix0;
import 'package:google_maps_flutter/google_maps_flutter.dart' as prefix1;

//once the data has been fetched, we want to notify UI to update itself
class PlaceListViewModel extends ChangeNotifier {
  //should make it private and then use UnmodifiableListView
  var places = List<PlaceViewModel>();

  var mapType = prefix1.MapType.normal;

  void toggleMapType() {
    mapType = mapType == prefix1.MapType.normal
        ? prefix1.MapType.satellite
        : prefix1.MapType.normal;
    notifyListeners();
  }

  Future<void> fetchPlacesByKeywordAndPosition(
      String keyword, double latitude, double longitude) async {
    //this result is a list of place, UI should have no idea about the domain
    // models, so we want to create a list of place view model
    final results = await Webservice()
        .fetchPlacesByKeywordAndPosition(keyword, latitude, longitude);
    //so here we convert it to a lit of PlaceViewModel, and UI only get data
    // from the view model
    places = results.map((place) => PlaceViewModel(place)).toList();
    //we are notifying whoever is listener
    notifyListeners();
  }

  Future<void> openMapsFor(PlaceViewModel placeVM) async {
    //prefix0. is to distinguish between MapType on Google and on MapLauncher
    if (await MapLauncher.isMapAvailable(prefix0.MapType.google)) {
      await MapLauncher.launchMap(
          mapType: prefix0.MapType.google,
          coords: Coords(placeVM.latitude, placeVM.longitude),
          title: placeVM.name,
          description: placeVM.name);
    } else if (await MapLauncher.isMapAvailable(prefix0.MapType.apple)) {
      await MapLauncher.launchMap(
          mapType: prefix0.MapType.apple,
          coords: Coords(placeVM.latitude, placeVM.longitude),
          title: placeVM.name,
          description: placeVM.name);
    }
  }
}
