import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:placefinderapp/viewmodels/placeListViewModel.dart';
import 'pages/homePage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ChangeNotifierProvider(
        create: (context) => PlaceListViewModel(),
        child: HomePage(),
      ),
    );
  }
}

// //this is original google map tutorial plus geolocator
//class MyApp extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return MaterialApp(
//      title: 'Flutter Google Maps Demo',
//      home: MapSample(),
//    );
//  }
//}
//
//class MapSample extends StatefulWidget {
//  @override
//  State<MapSample> createState() => MapSampleState();
//}
//
//class MapSampleState extends State<MapSample> {
//  Completer<GoogleMapController> _controller = Completer();
//
//  static final CameraPosition _kGooglePlex = CameraPosition(
//    target: LatLng(37.42796133580664, -122.085749655962),
//    zoom: 14.4746,
//  );
//
////  static final CameraPosition _kLake = CameraPosition(
////      bearing: 192.8334901395799,
////      target: LatLng(37.43296265331129, -122.08832357078792),
////      tilt: 59.440717697143555,
////      zoom: 19.151926040649414,
////  );
//
//  //in this way when the map created, we are able to find our current location
//  // and move map camera to our location automatically instead of
//  // using properties in GoogleMap
//  // myLocationEnabled: true,
//  // myLocationButtonEnabled: true,
//  Future<void> _onMapCreated(GoogleMapController controller) async {
//    //this is to say we have finished loading the map
//    _controller.complete(controller);
//    //here we use Geolocator plugin
//    final position = await Geolocator()
//        .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
//
//    controller.animateCamera(
//      CameraUpdate.newCameraPosition(
//        CameraPosition(
//          target: LatLng(position.latitude, position.longitude),
//          zoom: 14,
//        ),
//      ),
//    );
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return new Scaffold(
//      body: GoogleMap(
//        myLocationEnabled: true,
//        myLocationButtonEnabled: true,
//        mapType: MapType.normal,
//        initialCameraPosition: _kGooglePlex,
//        onMapCreated: _onMapCreated,
//      ),
////      floatingActionButton: FloatingActionButton.extended(
////        onPressed: _goToTheLake,
////        label: Text('To the lake!'),
////        icon: Icon(Icons.directions_boat),
////      ),
//    );
//  }
//
////  Future<void> _goToTheLake() async {
////    final GoogleMapController controller = await _controller.future;
////    controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
////  }
//}
