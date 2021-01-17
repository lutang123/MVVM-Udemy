//we will not want to expose our place class, because it can have other business
// domain object and other stuff that is going on right now, this is why we
// need to create view model

//this is to change json format to our class object, and this is just for one
//place, the result we get is an array of place, all in the same structure
class Place {
  final String name;
  final String placeId;
  final double latitude;
  final double longitude;
  final String photoURL;

  //must have ; at the end of this line, otherwise it shows empty constructor body
  Place(
      {this.name, this.placeId, this.latitude, this.longitude, this.photoURL});

  factory Place.fromJson(Map<String, dynamic> json) {
    //add this
    Iterable photos = json['photos'];
    //we can not just copy path, and not use.
    return Place(
      latitude: json['geometry']['location']['lat'],
      longitude: json['geometry']['location']['log'],
      name: json['name'],
      //add this
      photoURL: photos == null
          ? "images/place-holder.png"
//          : json['photos'][0]['photo_reference'],

          //why toString() it's already a string??
          : photos.first["photo_reference"].toString(),
//      photoURL: json['photos'][0]['photo_reference'],
      placeId: json['place_id'],
    );
  }
}
