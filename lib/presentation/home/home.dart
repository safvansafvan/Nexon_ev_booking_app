import 'package:bookingapp/presentation/booking/car_booking.dart';
import 'package:bookingapp/presentation/map/location.dart';
import 'package:bookingapp/presentation/test_drive_booking/test_booking.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    TestDriveBooking(),
    BookingWidget(),
    MapWidget(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your App'),
      ),
      body: _screens[_currentIndex],
      bottomNavigationBar: GNav(
        backgroundColor: Colors.white,
        color: Colors.black,
        gap: 8,
        padding: EdgeInsets.all(16),
        selectedIndex: _currentIndex,
        tabs: [
          GButton(
            icon: Icons.home_outlined,
            text: "Home",
          ),
          GButton(
            icon: Icons.bookmark_add_outlined,
            text: "Booking",
          ),
          GButton(
            icon: Icons.map_rounded,
            text: "Map",
          ),
        ],
        onTabChange: (index) {
          setState(() {
            _currentIndex = index;
          });
          switch (index) {
            case 0:
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return TestDriveBooking();
              },));
              break;
            case 1:
            Navigator.push(context, MaterialPageRoute(builder: (context) {
                return BookingWidget();
              },));
              break;
            case 2:
             Navigator.push(context, MaterialPageRoute(builder: (context) {
                return MapWidget();
              },));
              break;
          }
        },
      ),
    );
  }
}