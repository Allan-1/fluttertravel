import 'package:flutter/material.dart';

import '../util/places.dart';
import '../widgets/horizontal_place_item.dart';
import '../widgets/icon_badge.dart';
import '../widgets/search_bar.dart';
import '../widgets/vertical_place_item.dart';


class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
        children: <Widget>[
          const Padding(
            padding: EdgeInsets.all(20.0),
            child: Text(
              "Where are you \ngoing?",
              style: TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: SearchBar(),
          ),
          buildHorizontalList(context),
          buildVerticalList(),
        ],
      );
  }

  buildHorizontalList(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 10.0, left: 20.0),
      height: 250.0,
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        primary: false,
        itemCount: places.length,
        itemBuilder: (BuildContext context, int index) {
          final place = places.reversed.toList()[index];
          return HorizontalPlaceItem(place: place);
        },
      ),
    );
  }

  buildVerticalList() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: ListView.builder(
        primary: false,
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: places.length,
        itemBuilder: (BuildContext context, int index) {
          final place = places[index];
          return VerticalPlaceItem(place: place);
        },
      ),
    );
  }
}
