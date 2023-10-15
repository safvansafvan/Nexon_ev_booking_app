import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:flutter/material.dart';
import '../../../widgets/page_indicator.dart';
import 'widget/specification_box_widget.dart';
import 'package:nexonev/controller/core/constant.dart';
import 'package:nexonev/presentation/widgets/text_h.dart';
import 'package:nexonev/presentation/screens/mainscreen/booking&details/widget/bookings_field.dart';
import 'package:nexonev/presentation/screens/mainscreen/booking&details/widget/option_widget.dart';

class NexonEvDetailsAndBookings extends StatelessWidget {
  const NexonEvDetailsAndBookings(
      {super.key, required this.images, required this.data});
  final dynamic images;
  final Map<String, dynamic> data;
  @override
  Widget build(BuildContext context) {
    final pageController = PageController();
    var screenSize = MediaQuery.of(context).size;
    final nullContr = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
        ),
        title: HeadingTextWidget(
          text: data['name'],
          color: kBlack,
          fontWeight: FontWeight.w600,
          textSize: 20,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: [
            Column(
              children: [
                SizedBox(
                  height: screenSize.height * 0.28,
                  width: double.infinity,
                  child: PageView.builder(
                    controller: pageController,
                    itemBuilder: (context, index) {
                      return SizedBox(
                        child: Image.asset(
                          images[index % images.length],
                          fit: BoxFit.cover,
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
            CustomHeight.heightTen(context),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                OptionsBoxWidget(
                    title: "Range",
                    subtitle: data['range'],
                    screenSize: screenSize),
                OptionsBoxWidget(
                    title: "Fast Charge",
                    subtitle: data['fastCharge'],
                    screenSize: screenSize),
                OptionsBoxWidget(
                    title: "Warrenty",
                    subtitle: data['warenty'],
                    screenSize: screenSize),
              ],
            ),
            CustomHeight.commonHeightz(context),
            HeadingTextWidget(
                text: "Specification",
                color: kBlack,
                fontWeight: FontWeight.w600,
                textSize: 20),
            CustomHeight.commonHeightz(context),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  flex: 1,
                  child: Container(
                    height: screenSize.height * 0.1,
                    width: screenSize.height * 0.15,
                    decoration: BoxDecoration(borderRadius: radiusTen),
                    child: Column(
                      children: [
                        HeadingTextWidget(
                          text: "Color",
                          fontWeight: FontWeight.w600,
                          textSize: 17,
                        ),
                        CustomDropdown(
                          items: data['colors'],
                          controller: nullContr,
                        )
                      ],
                    ),
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: SpecificationBoxWidget(
                      screenSize: screenSize,
                      title: "Gearbox",
                      subtitle: "Automatic"),
                ),
                Flexible(
                  flex: 1,
                  child: SpecificationBoxWidget(
                      screenSize: screenSize, title: "Seats", subtitle: "Four"),
                ),
              ],
            ),
            BookingsField(screenSize: screenSize)
          ],
        ),
      ),
    );
  }
}
