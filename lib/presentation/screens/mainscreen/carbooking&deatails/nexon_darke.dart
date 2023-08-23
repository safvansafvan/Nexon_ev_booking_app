import 'package:flutter/material.dart';
import '../../../widgets/page_indicator.dart';
import 'widget/specification_box_widget.dart';
import 'package:bookingapp/controller/core/constant.dart';
import 'package:bookingapp/presentation/widgets/text_h.dart';
import 'package:bookingapp/presentation/widgets/app_bar.dart';
import 'package:bookingapp/presentation/screens/mainscreen/carbooking&deatails/widget/bookings_field.dart';
import 'package:bookingapp/presentation/screens/mainscreen/carbooking&deatails/widget/option_widget.dart';

class NexonDarkEdition extends StatelessWidget {
  const NexonDarkEdition({super.key});

  @override
  Widget build(BuildContext context) {
    final pageController = PageController();
    List images = [
      "assets/sap.webp",
      "assets/wide.webp",
      "assets/nexon_black_back.png",
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
            CustomHeight.commonHeightz(context),
            HeadingTextWidget(
              text: "Nexon Dark Edition",
              color: kBlack,
              fontWeight: FontWeight.w600,
              textSize: 20,
              underline: true,
            ),
            CustomHeight.commonHeightz(context),
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
                CustomHeight.commonHeightz(context),
                PageIndicatorWidget(
                  pageController: pageController,
                  count: images.length,
                )
              ],
            ),
            height10,
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                OptionsBoxWidget(title: "Range", subtitle: "453# km"),
                OptionsBoxWidget(title: "Fast Charge", subtitle: "56(0-80%)"),
                OptionsBoxWidget(title: "Torque", subtitle: "250Nm"),
              ],
            ),
            CustomHeight.commonHeightz(context),
            HeadingTextWidget(
              text: "Specification",
              color: kBlack,
              fontWeight: FontWeight.w600,
              textSize: 20,
              underline: true,
            ),
            CustomHeight.commonHeightz(context),
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
                      height10,
                      const Text("Black")
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
