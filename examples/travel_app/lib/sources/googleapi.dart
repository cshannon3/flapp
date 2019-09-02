
import 'package:travel_app/models/destination.dart';
import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;


final String API_KEY = "AIzaSyDgObRr_huAXQ-ssfiJoMLpxMiDX_UgsZs";

class APIManager{
  APIManager();


  Future<Stream<DestinationModel>> getDestinationLocation(String placeName, String country) async {
    var url = 'https://maps.googleapis.com/maps/api/geocode/json?address=$placeName,$country&key=$API_KEY';


    var client = new http.Client();
    var streamedRes = await client.send(
        new http.Request('get', Uri.parse(url))
    );

    return streamedRes.stream
        .transform(utf8.decoder)
        .transform(json.decoder)

        .expand((jsonBody) => (jsonBody as Map) ['results'] )
        .map((jsonDest) => new DestinationModel.fromMap(jsonDest));

  }
}

