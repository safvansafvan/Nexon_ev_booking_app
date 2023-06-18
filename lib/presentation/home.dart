import 'package:bookingapp/controller/const/const.dart';
import 'package:bookingapp/presentation/booking/car_booking.dart';
import 'package:bookingapp/presentation/map/location.dart';
import 'package:bookingapp/presentation/test_drive_booking/test_booking.dart';
import 'package:bookingapp/presentation/widget/app_bar.dart';
import 'package:bookingapp/presentation/widget/drawer.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;

  final List screens = const [
    TestDriveBooking(),
    BookingWidget(),
    MapWidget(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage("assets/nexon_ev_banner_mobil.jpg"),
          ),
        ),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppBarWidget(
                menu: true,
                leading: Icons.menu,
                title: "Nexon",
                trailing: Icons.settings,
              ),
              Expanded(
                child: screens[_currentIndex],
              )
            ],
          ),
        ),
      ),
      drawer: const DrawerWidget(),
      bottomNavigationBar: GNav(
        color: kwhite,
        haptic: true,
        activeColor: kwhite,
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
        },
      ),
    );
  }
}
