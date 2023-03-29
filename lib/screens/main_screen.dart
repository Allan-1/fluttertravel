import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:mytravel/screens/profile_screen.dart';
import 'package:mytravel/screens/booking_screen.dart';
import 'package:mytravel/screens/hotel_screen.dart';

import '../widgets/icon_badge.dart';
import 'home.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late PageController _pageController;
  int _page = 0;

  List<Widget> screenOption = [
    const Home(),
    const HotelScreen(),
    const ProfileScreen()
  ];
  int selectedIndex = 0;

  void itemTapped(index){
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
      bottomNavigationBar:  Padding(
        padding: const EdgeInsets.all(8.0),
        child: GNav(
          gap: 8,
          tabBackgroundColor: Colors.blue,
          activeColor: Colors.white,
          backgroundColor: Colors.white10,
          color: Colors.blueGrey,
          padding: const EdgeInsets.all(16),
          onTabChange: itemTapped,
          tabs: const [
            GButton(
              icon: Icons.home,
              text: "Home",
            ),
            GButton(
              icon: Icons.hotel,
              text: "Hotels",
            ),

            GButton(
              icon: Icons.person,
              text: "Profile",
            ),
          ],
        ),
      ),
      body: screenOption[selectedIndex],
    );
  }

  void navigationTapped(int page) {
    _pageController.jumpToPage(page);
  }

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  void onPageChanged(int page) {
    setState(() {
      _page = page;
    });
  }

  Widget barIcon(
      {IconData icon = Icons.home, int page = 0, bool badge = false}) {
    return IconButton(
      icon: badge
          ? IconBadge(
              icon: icon,
              size: 24.0,
              key: null,
              color: Colors.black,
            )
          : Icon(icon, size: 24.0),
      color: _page == page
          ? Theme.of(context).colorScheme.secondary
          : Colors.blueGrey[300],
      onPressed: () => _pageController.jumpToPage(page),
    );
  }
}
