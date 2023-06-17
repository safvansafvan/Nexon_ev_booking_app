import 'package:bookingapp/controller/const/const.dart';
import 'package:bookingapp/presentation/booking/car_booking.dart';
import 'package:bookingapp/presentation/authentication/login.dart';
import 'package:bookingapp/presentation/map/location.dart';
import 'package:bookingapp/presentation/test_drive_booking/test_booking.dart';
import 'package:bookingapp/presentation/widget/snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;

  // final List<Widget> _screens = [
  //   TestDriveBooking(),
  //   BookingWidget(),
  //   MapWidget(),
  // ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your App'),
      ),
      body: InkWell(
          onTap: () async {
            final SharedPreferences prefs =
                await SharedPreferences.getInstance();
            prefs.remove("isLoggedIn");
            prefs.remove("USER_NAME");
            prefs.remove("USER_EMAIL");
            // ignore: use_build_context_synchronously
            snakBarWiget(context: context, title: "Logout Success", clr: kred);
            // ignore: use_build_context_synchronously
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) => const LoginPage(),
                ),
                (route) => false);
          },
          child: const Center(child: Text("logout"))),
      bottomNavigationBar: GNav(
        backgroundColor: Colors.white,
        color: Colors.black,
        gap: 8,
        padding: const EdgeInsets.all(16),
        selectedIndex: _currentIndex,
        tabs: const [
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
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return const TestDriveBooking();
                },
              ));
              break;
            case 1:
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return const BookingWidget();
                },
              ));
              break;
            case 2:
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return const MapWidget();
                },
              ));
              break;
          }
        },
      ),
    );
  }
}
