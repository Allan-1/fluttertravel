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