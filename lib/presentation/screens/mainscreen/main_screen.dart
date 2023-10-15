import 'package:nexonev/controller/core/cars_data.dart';
import 'package:nexonev/controller/providers/dealer_provider.dart';
import 'package:nexonev/controller/providers/get_user_details.dart';
import 'package:nexonev/controller/providers/map_provider/map_provider.dart';
import 'package:nexonev/presentation/screens/brochure/brochure.dart';
import 'package:nexonev/presentation/widgets/app_bar.dart';
import 'package:nexonev/presentation/widgets/drawer.dart';
import 'package:nexonev/presentation/widgets/login_dialog.dart';
import 'package:flutter/material.dart';
import 'package:nexonev/controller/core/constant.dart';
import 'package:nexonev/presentation/widgets/text_h.dart';
import 'package:nexonev/presentation/widgets/page_indicator.dart';
import 'package:nexonev/presentation/screens/mainscreen/widget/popular_options.dart';
import 'package:provider/provider.dart';

import 'booking&details/ev_details_and_bookings.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final pageController = PageController();
  GetUserDetials user = GetUserDetials();

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<GetUserDetials>(context, listen: false);
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await fetchDatas(context);
    });
    List image = [
      "assets/images/primenexon-.png",
      "assets/images/nexon.webp",
      "assets/images/sap.webp"
    ];

    List carName = ["Nexon Ev Prime ", "Nexon Ev Max", "Nexon Ev Dark"];

    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size(double.infinity, 50),
          child: SafeArea(
            child: AppBarWidget(
              leading: Icons.menu,
              menu: true,
              title: "Nexon",
              trailing: Icons.settings,
              settings: true,
            ),
          )),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: [
            TextButton(
              onPressed: () async {},
              child: Align(
                alignment: Alignment.topRight,
                child: Text(
                  "Call 1800 209 8282",
                  style: TextStyle(color: kblue),
                ),
              ),
            ),
            CustomHeight.heightTen(context),
            HeadingTextWidget(
              text: " Editions",
              color: kBlack,
              fontWeight: FontWeight.w600,
              textSize: 19,
            ),
            CustomHeight.heightTen(context),
            SizedBox(
              height: 250,
              width: double.infinity,
              child: PageView.builder(
                controller: pageController,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      InkWell(
                        onTap: () {
                          if (user.token == null) {
                            return loginReqDialog(context);
                          }
                          if (index % image.length == 0) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) {
                                return NexonEvDetailsAndBookings(
                                    images: NexonEvPrime.images,
                                    data: NexonEvPrime.evPrime);
                              }),
                            );
                          } else if (index % image.length == 1) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => NexonEvDetailsAndBookings(
                                    images: NexonEvMax.images,
                                    data: NexonEvMax.evMax),
                              ),
                            );
                          } else if (index % image.length == 2) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => NexonEvDetailsAndBookings(
                                    images: NexonEvBlack.images,
                                    data: NexonEvBlack.nexonBlackData),
                              ),
                            );
                          }
                        },
                        child: SizedBox(
                          height: 200,
                          width: double.infinity,
                          child: Image.asset(
                            image[index % image.length],
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Text(
                        carName[index % carName.length],
                        style: textStyleFuc(
                            weight: FontWeight.w500, color: kBlack, size: 20),
                      ),
                    ],
                  );
                },
              ),
            ),
            Center(
              child: PageIndicatorWidget(
                  pageController: pageController, count: image.length),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const BrochureGridViewWidget(),
                  ),
                );
              },
              child: Align(
                alignment: Alignment.topRight,
                child: Text(
                  "Car Brochure",
                  style: TextStyle(color: kblue, fontSize: 16),
                ),
              ),
            ),
            HeadingTextWidget(
              text: "Popular Options",
              color: kBlack,
              fontWeight: FontWeight.w600,
              textSize: 19,
            ),
            CustomHeight.heightTen(context),
            const PopularOptionsWidges(),
          ],
        ),
      ),
      drawer: const DrawerWidget(),
    );
  }

  Future<void> fetchDatas(context) async {
    final provider = Provider.of<GetUserDetials>(context, listen: false);
    await Provider.of<MapProvider>(context, listen: false)
        .fetchCharginLocation(context);
    await Provider.of<DealerProvider>(context, listen: false).getDealer();
    await provider.getUsername();
    await provider.getUSerEmail();
  }
}
