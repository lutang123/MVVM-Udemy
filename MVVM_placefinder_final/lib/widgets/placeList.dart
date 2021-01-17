import 'package:flutter/material.dart';
import 'package:place_finder/utils/urlHelper.dart';
import 'package:place_finder/viewmodels/placeViewModel.dart';

class PlaceList extends StatelessWidget {
  final List<PlaceViewModel> places;
//  final Function(PlaceViewModel) onSelected;
  final Function onSelected;

  PlaceList({this.places, this.onSelected});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: this.places.length,
      itemBuilder: (context, index) {
        final place = this.places[index];

        return ListTile(
            onTap: () {
              onSelected(place);
            },
            leading: Container(
                width: 100,
                height: 100,
                child: Image.network(
                    UrlHelper.urlForReferenceImage(place.photoURL),
                    fit: BoxFit.cover)),
            title: Text(place.name));
      },
    );
  }
}
