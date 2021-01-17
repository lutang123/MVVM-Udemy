import 'dart:async';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:map_launcher/map_launcher.dart';
import 'package:placefinderapp/viewmodels/placeListViewModel.dart';
//import 'package:placefinderapp/viewmodels/placeViewModel.dart';
import 'package:placefinderapp/widget/place_list.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ////what is Completer?
  ////this is convert final field
  //final Completer<GoogleMapController> _controller = Completer();
  ////same as above just convert to getter
  Completer<GoogleMapController> get _controller => Completer();
//
//  //here we make it global, we assign value in _onMapCreated function, but at the
//  //same time we can access in other places with the new value
//  Position currentPosition;
//
////  //the following does not work, why? it seems the latitude and longitude on
////  // initialCameraPosition: is null; this works in weatherApp, we called
////  // updateUI which has setState in initState() to assign value to our variables
////  // but not here when launching google map, we just need latitude and longitude
////  double lat;
////  double lon;
////
////  @override
////  void initState() {
////    super.initState();
////    //call this function here to give value to lat and lon
////    currentLocation();
////  }
////
////  Future<void> currentLocation() async {
////    var currentPosition = await Geolocator()
////        .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
////    lat = currentPosition.latitude;
////    lon = currentPosition.longitude;
////    print(lat);
////    print(lon);
////  }
//
//  //set has to have the type Marker
//  Set<Marker> _getPlaceMarkers(List<PlaceViewModel> places) {
//    return places.map((place) {
//      return Marker(
//        markerId: MarkerId(place.placeId),
//        //we use default icon for Markers
//        icon: BitmapDescriptor.defaultMarker,
//        //this is what do you want to see about this place
//        infoWindow: InfoWindow(title: place.name),
//        position: LatLng(place.latitude, place.longitude),
//      );
//    }).toSet();
//  }
//
//  ////in this way when the map created, we are able to find our current location
////  // and move map camera to our location automatically instead of
////  // using properties in GoogleMap
////  // myLocationEnabled: true,
////  // myLocationButtonEnabled: true,
//
//  //_onMapCreated is Type: void Function(GoogleMapController)
//  //this function enables map to point our current location when opening
//
//  Future<void> _onMapCreated(GoogleMapController controller) async {
//    //is this to complete loading map?
//    _controller.complete(controller);
//    //this we assign value to _currentPosition
//    currentPosition = await Geolocator()
//        .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
//    //then we use GoogleMapController controller to point newCameraPosition
//    controller.animateCamera(
//      CameraUpdate.newCameraPosition(
//        CameraPosition(
//          target: LatLng(currentPosition.latitude, currentPosition.longitude),
//          zoom: 14,
//        ),
//      ),
//    );
//  }
//
//  Future<void> _openMapsFor(PlaceViewModel placeVM) async {
//    //prefix0. is to distinguish between MapType on Google and on MapLauncher
//    if (await MapLauncher.isMapAvailable(prefix0.MapType.google)) {
//      await MapLauncher.launchMap(
//          mapType: prefix0.MapType.google,
//          coords: Coords(placeVM.latitude, placeVM.longitude),
//          title: placeVM.name,
//          description: placeVM.name);
//    } else if (await MapLauncher.isMapAvailable(prefix0.MapType.apple)) {
//      await MapLauncher.launchMap(
//          mapType: prefix0.MapType.apple,
//          coords: Coords(placeVM.latitude, placeVM.longitude),
//          title: placeVM.name,
//          description: placeVM.name);
//    }
//  }

  //this is just to add sample code from map_launch
  openMapsSheet(context) async {
    try {
      final title = "Shanghai Tower";
      final description = "Asia's tallest building";
      final coords = Coords(31.233568, 121.505504);
      final availableMaps = await MapLauncher.installedMaps;

      showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return SafeArea(
            child: SingleChildScrollView(
              child: Container(
                child: Wrap(
                  children: <Widget>[
                    for (var map in availableMaps)
                      ListTile(
                        onTap: () => map.showMarker(
                          coords: coords,
                          title: title,
                          description: description,
                        ),
                        title: Text(map.mapName),
                        leading: Image(
                          image: map.icon,
                          height: 30.0,
                          width: 30.0,
                        ),
                      ),
                  ],
                ),
              ),
            ),
          );
        },
      );
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    // when we move all the functions inside, we can put this variable here:
    Position currentPosition;
    final vm = Provider.of<PlaceListViewModel>(context);
    print(vm.places); //why do I get []??

    return Scaffold(
      body: Stack(
        children: <Widget>[
          //use Stack
          GoogleMap(
//            //Type: Set<Marker>
//            markers: _getPlaceMarkers(vm.places),

            //we can write like this too, here we pass our data vm.places to
            // create a set of markers:
            markers: vm.places //this is a list of place
                .map(
                  (place) => Marker(
                    markerId: MarkerId(place.placeId),
                    //we use default icon for Markers
                    icon: BitmapDescriptor.defaultMarker,
                    //this is what do you want to see about this place
                    infoWindow: InfoWindow(title: place.name),
                    position: LatLng(place.latitude, place.longitude),
                  ),
                )
                .toSet(),

            myLocationEnabled: true,

            //we did not call this function here
            //_onMapCreated(GoogleMapController controller)

            //Type: void Function(GoogleMapController)
//            onMapCreated: _onMapCreated,

            //we can also directly write here:
            onMapCreated: (GoogleMapController controller) async {
              //is this to complete loading map?
              _controller.complete(controller);
              //this we assign value to _currentPosition
              currentPosition = await Geolocator()
                  .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
              //then we use GoogleMapController controller to point newCameraPosition
              controller.animateCamera(
                CameraUpdate.newCameraPosition(
                  CameraPosition(
                    target: LatLng(
                        currentPosition.latitude, currentPosition.longitude),
                    zoom: 14,
                  ),
                ),
              );
            },
            //we make _onMapCreated to point our current location, do we still
//          assign initial one to a random location??
            initialCameraPosition: CameraPosition(
              target: LatLng(45.521563, -122.677433),
              zoom: 14,
            ),

//          // I tried to get lat and lon from initState() but not working??
//          initialCameraPosition: CameraPosition(
//            target: LatLng(lat, lon),
//            zoom: 14,
//          ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                onSubmitted: (value) {
                  //this will give places which is List<PlaceViewModel>
                  vm.fetchPlacesByKeywordAndPosition(value,
                      currentPosition.latitude, currentPosition.longitude);
                },
                decoration: InputDecoration(
                  labelText: "Search here",
                  fillColor: Colors.white,
                  filled: true,
                ),
              ),
            ),
          ),
          Visibility(
            visible: vm.places.length > 0 ? true : false,
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: FlatButton(
                    child: Text(
                      'show list',
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () {
                      showModalBottomSheet(
                        context: context,
                        builder: (context) => PlaceList(
//                          places: vm.places,
//                          //again we did not call this function here:
//                          //this is a callback function with places[index] as parameter
////                          onSelected: _openMapsFor, //pass data here
//
//                          ////in PlaceList:
//                          //onTap: () {
//                          //            onSelected(places[index]);
//                          //          },
//
//                          //we can also write like this:
//                          onTapCallBack: (PlaceViewModel placeVM) async {
//                            //prefix0. is to distinguish between MapType on Google and on MapLauncher
//                            if (await MapLauncher.isMapAvailable(
//                                prefix0.MapType.google)) {
//                              await MapLauncher.launchMap(
//                                  mapType: prefix0.MapType.google,
//                                  coords: Coords(
//                                      placeVM.latitude, placeVM.longitude),
//                                  title: placeVM.name,
//                                  description: placeVM.name);
//                            } else if (await MapLauncher.isMapAvailable(
//                                prefix0.MapType.apple)) {
//                              await MapLauncher.launchMap(
//                                  mapType: prefix0.MapType.apple,
//                                  coords: Coords(
//                                      placeVM.latitude, placeVM.longitude),
//                                  title: placeVM.name,
//                                  description: placeVM.name);
//                            }
//                          },
//                          ////reference:
                            //onTap: () {
                            //            onTapCallBack(places[index]);
                            //          },
                            ),
                      );
                    },
                    color: Colors.grey,
                  ),
                ),
              ),
            ),
          ),

          //this pop up the available map and point to Shanghai Tower
          Padding(
            padding: const EdgeInsets.only(top: 200.0, left: 20),
            child: FloatingActionButton(
              onPressed: () => openMapsSheet(context),
              child: Text('Show Maps'),
            ),
          ),
        ],
      ),
    );
  }
}
