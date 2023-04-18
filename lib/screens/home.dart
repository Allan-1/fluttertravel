import 'package:flutter/material.dart';
import 'package:mytravel/api/getcitiesapi.dart';
import 'package:mytravel/util/cities.dart';
import 'package:mytravel/widgets/horizontal_place_item_grid.dart';

import '../util/places.dart';
import '../widgets/horizontal_place_item.dart';
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
        // Padding(
        //   padding: const EdgeInsets.all(20.0),
        //   child: SearchBar(),
        // ),
        buildGridList(context)
        // buildVerticalList(),
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

  buildGridList(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.8,
      child: Padding(
        padding:const  EdgeInsets.all(8.0),
        child: FutureBuilder(
          future: fetchCity(),
          builder: (context, snapshot) => snapshot.hasData ? GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              itemCount: cities.length,
              itemBuilder: (context, index) {
                final city = cities[index];
                return HorizontalPlaceItemGrid(place: city);
              }): const CircularProgressIndicator()
        ) ,
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
