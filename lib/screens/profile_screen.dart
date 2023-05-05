import 'package:flutter/material.dart';
import 'package:mytravel/screens/booked_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView(
        children: [
          ListTile(
            leading: Icon(Icons.book_rounded),
            title: Text("Booking"),
            trailing: Icon(Icons.navigate_next),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const BookedScreen()));
            },
          ),
          const ListTile(
            leading: Icon(Icons.person),
            title: Text("Profile"),
            trailing: Icon(Icons.navigate_next),
          ),
          const ListTile(
            leading: Icon(Icons.message),
            title: Text("Messages"),
            trailing: Icon(Icons.navigate_next),
          ),
          const ListTile(
            leading: Icon(Icons.settings),
            title: Text("Preferences"),
            trailing: Icon(Icons.navigate_next),
          ),
          const ListTile(
            leading: Icon(Icons.help),
            title: Text("Support"),
            trailing: Icon(Icons.navigate_next),
          ),
          OutlinedButton(
            onPressed: () {},
            child: const Text("Sign Out"),
          )
        ],
      ),
    );
  }
}
