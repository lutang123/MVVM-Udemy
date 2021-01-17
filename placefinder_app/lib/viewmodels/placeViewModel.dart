//this view model will represent a single place like a certain coffee shop
//so what kind of data we want to expose using place view model
//in our case we use all the data in Place, but it may not always the case

import 'package:placefinderapp/model/place.dart';

class PlaceViewModel {
  //we make place private so that other class can not access
  Place _place;
  //here we pass the place and assign it to to this private place
  PlaceViewModel(Place place) {
    _place = place;
  }

//  //reference
//  NewsArticle _newsArticle;
//
//  NewsArticleViewModel({NewsArticle article}): _newsArticle = article;

  //the following is to show different properties we are going to expose to the view
  //you can see we are not exposing our place object
  //we simply use the place model to expose the data to the rest of the UI
  String get placeId {
    return _place.placeId;
  }

  String get photoURL {
    return _place.photoURL;
  }

  String get name {
    return _place.name;
  }

  double get latitude {
    return _place.latitude;
  }

  double get longitude {
    return _place.longitude;
  }
}
