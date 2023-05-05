import 'package:flutter/material.dart';

class BookedScreen extends StatefulWidget {
  const BookedScreen({Key? key}) : super(key: key);

  @override
  State<BookedScreen> createState() => _BookedScreenState();
}

class _BookedScreenState extends State<BookedScreen> {
  List<Map<String, dynamic>> bookedHotels = [
    {
      "name": "Silver Rock Hotel",
      "price": "5000",
      "nights": 2,
      "total": "10000"
    }
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Booking"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "You have booked ${bookedHotels.length} hotel(s)",
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
                child: ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  leading: const Icon(Icons.hotel),
                  title: Text(bookedHotels[index]['name']),
                  subtitle: Text(
                      "Number of nights: ${bookedHotels[index]['nights']}"),
                  trailing:
                      Text("Total price: ${bookedHotels[index]['total']}"),
                );
              },
              itemCount: bookedHotels.length,
            ))
          ],
        ),
      ),
    );
  }
}
