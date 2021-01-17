import 'dart:convert';

import 'package:placefinderapp/utils/api_key.dart';
import 'package:http/http.dart' as http;
import 'package:placefinderapp/model/place.dart';

class Webservice {
  String urlFirstPart =
      'https://maps.googleapis.com/maps/api/place/nearbysearch/';

  Future<List<Place>> fetchPlacesByKeywordAndPosition(
      String keyword, double latitude, double longitude) async {
    var url =
        '${urlFirstPart}json?location=$latitude,$longitude&radius=1500&type=restaurant&keyword=$keyword&key=$apiKey';

    final http.Response response = await http.get(url);

    if (response.statusCode == 200) {
      final jsonResponse = jsonDecode(response.body);
      final Iterable results = jsonResponse['result'];
      return results.map((place) => Place.fromJson(place)).toList();
    } else {
      throw Exception('Unable to perform request');
    }
  }

  static String urlForReferenceImage(String photoReferenceId) {
    return "https://maps.googleapis.com/maps/api/place/photo?maxwidth=400&photoreference=$photoReferenceId&key=AIzaSyAKVyDXOkWeNuR-7_4F7K2LWvkTlPe830k";
  }
}
