import 'package:flutter/material.dart';

class SuccessBook extends StatelessWidget {
  const SuccessBook({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Center(child: Text("Hotel Booked Succesfully")),
    );
  }
}
