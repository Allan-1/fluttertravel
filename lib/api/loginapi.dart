import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:jwt_decoder/jwt_decoder.dart';

Future<Map<String, dynamic>> signupApi(
    String username, String password, String email) async {
  const String apiUrl = 'http://10.0.2.2:3000/signup';
  Map body = {
    "username": username,
    "email": email,
    "password": password
  };
  var jsonBody = jsonEncode(body);
  final response = await http.post(Uri.parse(apiUrl), body: jsonBody);
  if(response.statusCode == 200){
    Map<String, dynamic> decodedJson = JwtDecoder.decode(jsonDecode(response.body));
    return decodedJson;
  }else{
    return jsonDecode(response.body);
  }
}
