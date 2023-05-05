import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mytravel/util/utils.dart';

Future<String> getAccessToken(String consumerKey, String consumerSecret) async {
  final response = await http.get(
    Uri.parse(
        'https://sandbox.safaricom.co.ke/oauth/v1/generate?grant_type=client_credentials'),
    headers: {
      'Authorization':
          'Basic ' + base64Encode(utf8.encode('$consumerKey:$consumerSecret')),
    },
  );

  if (response.statusCode == 200) {
    final data = jsonDecode(response.body);
    final accessToken = data['access_token'];
    return accessToken;
  } else {
    throw Exception('Failed to get access token');
  }
}

Future<String> initiatePayment({
  required String accessToken,
  required String phoneNumber,
  required double amount,
  required String referenceNumber,
}) async {
  final response = await http.post(
    Uri.parse(
        'https://sandbox.safaricom.co.ke/mpesa/stkpush/v1/processrequest'),
    headers: {
      'Authorization': 'Bearer $accessToken',
      'Content-Type': 'application/json',
    },
    body: jsonEncode({
      'BusinessShortCode': '174379',
      'Password':
          "MTc0Mzc5YmZiMjc5ZjlhYTliZGJjZjE1OGU5N2RkNzFhNDY3Y2QyZTBjODkzMDU5YjEwZjc4ZTZiNzJhZGExZWQyYzkxOTIwMTYwMjE2MTY1NjI3",
      'Timestamp': "20160216165627",
      'TransactionType': 'CustomerPayBillOnline',
      'Amount': amount.toString(),
      'PartyA': phoneNumber.toString(),
      'PartyB': '174379',
      'PhoneNumber': phoneNumber.toString(),
      'CallBackURL': 'https://mydomain.com/pat',
      'AccountReference': "Test",
      'TransactionDesc': 'Test',
    }),
  );

  if (response.statusCode == 200) {
    final data = jsonDecode(response.body);
    final checkoutRequestId = data['CheckoutRequestID'];
    return checkoutRequestId;
  } else {
    throw Exception('Failed to initiate payment');
  }
}

Future<void> makePayments(String phoneNumber, double total) async {
  const consumerKey = 'YltJbsNnibf92TLjVE8pthllHnDgnLmS';
  const consumerSecret = 'byFwzXwAjBXGyfhh';
  final phonenumber = phoneNumber;
  final amount = total;
  final referenceNumber = generateRandomString(10);

  try {
    final accessToken = await getAccessToken(consumerKey, consumerSecret);
    final checkoutRequestId = await initiatePayment(
        accessToken: accessToken,
        phoneNumber: phonenumber,
        amount: amount,
        referenceNumber: referenceNumber);
    print(
      'Payment Initiated $checkoutRequestId',
    );
  } catch (e) {
    print('Error making payment: $e');
  }
}
