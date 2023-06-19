import 'package:bookingapp/controller/const/const.dart';
import 'package:bookingapp/presentation/mainscreen/widget/popular_options.dart';
import 'package:bookingapp/presentation/widget/text_h.dart';
import 'package:flutter/material.dart';

List image = ["assets/neprime.jpeg", "assets/nexon.webp", "assets/sap.webp"];
List carName = ["Nexon Ev Prime ", "Nexon Ev Max", "Nexon Ev Dark"];

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: ListView(
        children: [
          TextButton(
            onPressed: () {},
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
          SizedBox(
            height: 250,
            width: 300,
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: image.length,
              itemBuilder: (context, index) {
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: 300,
                      height: 200,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(image[index]),
                        ),
                      ),
                    ),
                    Text(
                      carName[index],
                      style: textStyleFuc(
                          weight: FontWeight.w500, color: kBlack, size: 20),
                    ),
                  ],
                );
              },
            ),
          ),
          TextButton(
            onPressed: () {},
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
          commonHeight,
          const PopularOptionsWidges(),
        ],
      ),
    );
  }
}
