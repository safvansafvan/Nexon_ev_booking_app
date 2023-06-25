import 'package:bookingapp/controller/const/const.dart';
import 'package:bookingapp/controller/providers/bookings_provider/test_drive_provider.dart';
import 'package:bookingapp/presentation/mainscreen/main_screen.dart';
import 'package:bookingapp/presentation/map/location.dart';
import 'package:bookingapp/presentation/widget/app_bar.dart';
import 'package:bookingapp/presentation/widget/drawer.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;

  final List screens = [
    const MainScreen(),
    const MapWidget(),
  ];

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<TestDriveBookingProvider>(context, listen: false)
          .fetchDealer();
    });
    return Scaffold(
      extendBody: true,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            kHeightFive,
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
      drawer: const DrawerWidget(),
      bottomNavigationBar: GNav(
        color: kBlack,
        haptic: true,
        activeColor: kBlack,
        gap: 8,
        padding: const EdgeInsets.all(16),
        selectedIndex: _currentIndex,
        tabs: const [
          GButton(
            icon: Icons.home_outlined,
            text: "Home",
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
