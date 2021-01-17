import 'package:flutter/material.dart';
import 'package:placefinderapp/services/webservice.dart';
import 'package:provider/provider.dart';

class PlaceList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, places, child) => ListView.builder(
        itemCount: places.length,
        itemBuilder: (context, index) {
          return ListTile(
            onTap: () {
              places.openMapFor(places[index]);
            },
            leading: Container(
              width: 100,
              height: 100,
              child: Image.network(
                  Webservice.urlForReferenceImage(places[index].photoURL),
                  fit: BoxFit.cover),
            ),
            title: Text(places[index].name),
          );
        },
      ),
    );
  }
}

//the following is original that passing data from parent.

//import 'package:flutter/material.dart';
//import 'package:placefinderapp/viewmodels/placeViewModel.dart';
//import 'package:placefinderapp/services/webservice.dart';
//
//class PlaceList extends StatelessWidget {
//  final List<PlaceViewModel> places;
////  final Function(PlaceViewModel) onTapCallBack;
//
//  //try without parameter, this will not work, because here in this syntax, we
//  // are passing data,,
//  final Function onTapCallBack;
//
//  PlaceList({this.places, this.onTapCallBack});
//
//  @override
//  Widget build(BuildContext context) {
//    return ListView.builder(
//      itemCount: places.length,
//      itemBuilder: (context, index) {
//        return ListTile(
////          //The argument type dynamic Function(PlaceViewModel) can’t be
////          // assigned to the parameter type void Function().
////          //this is why the following is wrong:
////          onTap: onTapCallBack,
//
//          //this is correct
//          // Type: void Function()
//          onTap: () {
//            onTapCallBack(places[index]);
//          },
//          leading: Container(
//            width: 100,
//            height: 100,
//            child: Image.network(
//                Webservice.urlForReferenceImage(places[index].photoURL),
//                fit: BoxFit.cover),
//          ),
//          title: Text(places[index].name),
//        );
//      },
//    );
//  }
//}
