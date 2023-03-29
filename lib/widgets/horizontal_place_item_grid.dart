import 'package:flutter/material.dart';
import 'package:mytravel/models/cities_model.dart';
import 'package:mytravel/models/hotel_model.dart';
import 'package:mytravel/screens/home.dart';

import '../screens/details.dart';

class HorizontalPlaceItemGrid extends StatelessWidget {
  final CityModel place;

  const HorizontalPlaceItemGrid({super.key, required this.place});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20.0),
      child: InkWell(
        child: SizedBox(
          height: 250.0,
          width: 140.0,
          child: Column(
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  place.image,
                  height: 140.0,
                  width: 150.0,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 7.0),
              Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  place.name,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15.0,
                  ),
                  maxLines: 2,
                  textAlign: TextAlign.left,
                ),
              ),
              const SizedBox(height: 3.0),

            ],
          ),
        ),
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (BuildContext context) {
                return Home();
              },
            ),
          );
        },
      ),
    );
  }
}
