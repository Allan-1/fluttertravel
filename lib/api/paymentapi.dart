import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiServices {
  static Future payService(String phonenumber) {
    const String url = 'https://crctocore.pythonanywhere.com/api/services/';

    Map<String, String> headers = {
      "Content-Type": "application/json",
      "Accept": "application/json",
    };
    var data = {
      "service_id": "PDP0001",
      "user_id": "SU002",
      "national_id": "8711111",
      "channel_id": "webfev001-1",
      "service_type": "DirectServicePayment",
      "phone_number": '254$phonenumber',
      "input_params_values": {
        "enter_vehicle_numbe_plate": "KAG 202s",
        "select_parking_zone": '254$phonenumber',
        "phone_number": "254711123120"
      }
    };

    var body = jsonEncode(data);

    return http.post(Uri.parse(url), body: body, headers: headers);
  }
}