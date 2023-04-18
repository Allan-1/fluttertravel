import 'package:flutter/material.dart';
import 'package:mytravel/api/paymentapi.dart';

import '../widgets/icon_badge.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({Key? key}) : super(key: key);

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  final phonenumber = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Payments"),
        actions: <Widget>[
          IconButton(
            icon: const IconBadge(
              icon: Icons.notifications_none,
              size: 24.0,
              color: Colors.black,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Enter Phone Number To Complete Payment"),
            TextField(
              controller: phonenumber,
              decoration: InputDecoration(
                labelText: "Phone number"
              ),
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: ElevatedButton(onPressed: (){
                ApiServices.payService(phonenumber.text);
              }, child: const Text("Complete Payment")),
            )
          ],
        ),
      ),
    );
  }
}
