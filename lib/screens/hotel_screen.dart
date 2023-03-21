import 'package:flutter/material.dart';

import '../util/places.dart';
import '../widgets/search_bar.dart';
import '../widgets/vertical_place_item.dart';

class HotelScreen extends StatelessWidget {
  const HotelScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.1,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: SearchBar(),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.6,
            child: ListView.builder(
              primary: false,
              // physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: places.length,
              itemBuilder: (BuildContext context, int index) {
                final place = places[index];
                return VerticalPlaceItem(place: place);
              },
            ),
          )
        ],
      ),
    );
  }
}
