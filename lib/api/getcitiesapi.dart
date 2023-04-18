import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:mytravel/models/cities_model.dart';
import 'package:mytravel/models/hotel_model.dart';

Future<List<CityModel>> fetchCity() async {
  const String apiUrl = 'http://10.0.2.2:3000/cities';

  final response = await http.get(Uri.parse(apiUrl));
  if (response.statusCode == 200) {
    List<CityModel> products = (jsonDecode(response.body)['cities'] as List)
        .map((data) => CityModel.fromJson(data))
        .toList();
    return products;
  } else {
    throw Exception('Failed to load.');
  }
}

Future<List<HotelModel>> fetchHotels(String cityname) async {
  final String apiurl = 'http://10.0.2.2:3000/hotels/$cityname';

  final respose = await http.get(Uri.parse(apiurl));
  if (respose.statusCode == 200) {
    List<HotelModel> hotels = (jsonDecode(respose.body)['hotels'] as List)
        .map((data) => HotelModel.fromJson(data))
        .toList();
    return hotels;
  } else {
    throw Exception("Failed to load.");
  }
}
