class UrlHelper {
  String myAPIKey = 'AIzaSyAKVyDXOkWeNuR-7_4F7K2LWvkTlPe830k';
//AIzaSyAKVyDXOkWeNuR-7_4F7K2LWvkTlPe830k
  static String urlForReferenceImage(String photoReferenceId) {
    return "https://maps.googleapis.com/maps/api/place/photo?maxwidth=400&photoreference=$photoReferenceId&key=AIzaSyAKVyDXOkWeNuR-7_4F7K2LWvkTlPe830k";
  }

  static String urlForPlaceKeywordAndLocation(
      String keyword, double latitude, double longitude) {
    return "https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=$latitude,$longitude&radius=1500&type=restaurant&keyword=$keyword&key=AIzaSyAKVyDXOkWeNuR-7_4F7K2LWvkTlPe830k";
  }
}
