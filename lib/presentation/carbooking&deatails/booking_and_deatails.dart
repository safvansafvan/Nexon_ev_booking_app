import 'package:bookingapp/controller/const/const.dart';
import 'package:bookingapp/presentation/widget/app_bar.dart';
import 'package:bookingapp/presentation/widget/text_h.dart';
import 'package:flutter/material.dart';

List images = [
  "assets/neprime.jpeg",
  "assets/nexonEvB.png",
  "assets/nexonPrime1.png",
  "assets/prime.webp"
];

class NexonEvPrimeDeatails extends StatelessWidget {
  const NexonEvPrimeDeatails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size(double.infinity, 50),
        child: SafeArea(
          child:
              AppBarWidget(leading: Icons.arrow_back_ios_outlined, menu: false),
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
                    itemCount: images.length,
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
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
