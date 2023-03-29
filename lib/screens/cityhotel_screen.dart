import 'package:flutter/material.dart';

import '../util/places.dart';
import '../widgets/vertical_place_item.dart';

class CityHotelScreen extends StatelessWidget {
  final String cityname;
  const CityHotelScreen({Key? key, required this.cityname}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cityplaces = places.where((place) => place.city == cityname).toList();
    return Scaffold(
      appBar: AppBar(
        title: Text(cityname),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),

          child: ListView.builder(
            primary: false,
            // physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: cityplaces.length,
            itemBuilder: (BuildContext context, int index) {
              final place = cityplaces[index];
              return VerticalPlaceItem(place: place);
            },
          ),
        ),
    );
  }
}
