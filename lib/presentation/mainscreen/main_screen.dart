import 'package:bookingapp/presentation/brouchure/brouchure.dart';
import 'package:flutter/material.dart';
import 'package:bookingapp/controller/const/const.dart';
import 'package:bookingapp/presentation/widget/text_h.dart';
import 'package:bookingapp/presentation/widget/page_indicator.dart';
import 'package:bookingapp/presentation/carbooking&deatails/nexon_darke.dart';
import 'package:bookingapp/presentation/carbooking&deatails/nexon_max.dart';
import 'package:bookingapp/presentation/carbooking&deatails/nexon_prime.dart';
import 'package:bookingapp/presentation/mainscreen/widget/popular_options.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    List image = [
      "assets/neprime.jpeg",
      "assets/nexon.webp",
      "assets/sap.webp"
    ];
    List carName = ["Nexon Ev Prime ", "Nexon Ev Max", "Nexon Ev Dark"];
    final pageController = PageController();
    return Padding(
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
          height10,
          HeadingTextWidget(
            text: "Available Cars",
            color: kBlack,
            fontWeight: FontWeight.w500,
            textSize: 20,
            underline: true,
          ),
          height10,
          SizedBox(
            height: 250,
            width: double.infinity,
            child: PageView.builder(
              controller: pageController,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: InkWell(
                        onTap: () {
                          if (index % image.length == 0) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    const NexonEvPrimeDeatails(),
                              ),
                            );
                          } else if (index % image.length == 1) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    const NexonEvMaxDeatails(),
                              ),
                            );
                          } else if (index % image.length == 2) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const NexonDarkEdition(),
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
                "Car Brouchure",
                style: TextStyle(color: kblue),
              ),
            ),
          ),
          HeadingTextWidget(
            text: "Popular Options",
            color: kBlack,
            fontWeight: FontWeight.w500,
            textSize: 20,
            underline: true,
          ),
          height10,
          const PopularOptionsWidges(),
        ],
      ),
    );
  }
}
