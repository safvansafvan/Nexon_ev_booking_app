import 'package:flutter/material.dart';
import '../../../widget/page_indicator.dart';
import 'widget/specification_box_widget.dart';
import 'package:bookingapp/controller/core/core.dart';
import 'package:bookingapp/presentation/widget/text_h.dart';
import 'package:bookingapp/presentation/widget/app_bar.dart';
import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:bookingapp/presentation/screens/mainscreen/carbooking&deatails/widget/bookings_field.dart';
import 'package:bookingapp/presentation/screens/mainscreen/carbooking&deatails/widget/option_widget.dart';

class NexonEvPrimeDeatails extends StatelessWidget {
  const NexonEvPrimeDeatails({super.key});

  @override
  Widget build(BuildContext context) {
    final pageController = PageController();
    final nullContr = TextEditingController();
    List images = [
      "assets/primenexon-.png",
      "assets/nexonEvB.png",
      "assets/tata-nexon-ev-ri.png",
    ];
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size(double.infinity, 50),
        child: SafeArea(
          child: AppBarWidget(
              leading: Icons.arrow_back_ios_outlined,
              menu: false,
              settings: true),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: [
            commonHeight,
            HeadingTextWidget(
              text: "Nexon Ev Prime",
              color: kBlack,
              fontWeight: FontWeight.w600,
              textSize: 20,
              underline: true,
            ),
            commonHeight,
            Column(
              children: [
                SizedBox(
                  height: 200,
                  width: double.infinity,
                  child: PageView.builder(
                    controller: pageController,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: SizedBox(
                          height: 400,
                          width: double.infinity,
                          child: Image.asset(
                            images[index % images.length],
                            fit: BoxFit.cover,
                          ),
                        ),
                      );
                    },
                  ),
                ),
                commonHeight,
                PageIndicatorWidget(
                  pageController: pageController,
                  count: images.length,
                )
              ],
            ),
            commonHeight,
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                OptionsBoxWidget(title: "Range", subtitle: "312# km"),
                OptionsBoxWidget(
                    title: "Fast Charge", subtitle: "60min(10-80%)"),
                OptionsBoxWidget(title: "Warranty", subtitle: "8year/1.6L km"),
              ],
            ),
            commonHeight,
            HeadingTextWidget(
              text: "Specification",
              color: kBlack,
              fontWeight: FontWeight.w600,
              textSize: 20,
              underline: true,
            ),
            commonHeight,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 82,
                  width: 110,
                  decoration: BoxDecoration(borderRadius: radiusTen),
                  child: Column(
                    children: [
                      HeadingTextWidget(
                        text: "Color",
                        fontWeight: FontWeight.w600,
                        textSize: 17,
                      ),
                      CustomDropdown(
                        items: const ["Grey", "Blue"],
                        controller: nullContr,
                      )
                    ],
                  ),
                ),
                const SpecificationBoxWidget(
                    title: "Gearbox", subtitle: "Automatic"),
                const SpecificationBoxWidget(title: "Seats", subtitle: "Four"),
              ],
            ),
            const BookingsField()
          ],
        ),
      ),
    );
  }
}
