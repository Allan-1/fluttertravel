import 'package:flutter/material.dart';
import 'package:mytravel/widgets/booking_widget.dart';

import '../widgets/icon_badge.dart';

class BookingScreen extends StatelessWidget {
  const BookingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Booking"),
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
      body: const BookingWidget(),
    );
  }
}
