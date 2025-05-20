import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:hotelbooking/pages/booking.dart';
import 'package:hotelbooking/pages/home.dart';
import 'package:hotelbooking/pages/profile.dart';
import 'package:hotelbooking/pages/wallet.dart';

class Bottomnav extends StatefulWidget {
  const Bottomnav({super.key});

  @override
  _BottomnavState createState() => _BottomnavState();
}

class _BottomnavState extends State<Bottomnav> {
  late List<Widget> pages;
  late Home home;
  late Booking booking;
  late Profile profile;
  late Wallet wallet;

  int currentTabIndex = 0;

  @override
  void initState() {
    home = Home();
    booking = Booking();
    profile = Profile();
    wallet = Wallet();

    pages = [home, booking, wallet, profile];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        height: 70,
        backgroundColor: Colors.white,
        color: Colors.black,
        animationDuration: Duration(milliseconds: 500),
        onTap: (int index) {
          setState(() {
            currentTabIndex = index;
          });
        },
        items: [
          Icon(Icons.home, color: Colors.white, size: 30.0),
          Icon(Icons.shopping_bag, color: Colors.white, size: 30.0),
          Icon(Icons.wallet, color: Colors.white, size: 30.0),
          Icon(Icons.person, color: Colors.white, size: 30.0),
        ],
      ),
      body: pages[currentTabIndex],
    );
  }
}
