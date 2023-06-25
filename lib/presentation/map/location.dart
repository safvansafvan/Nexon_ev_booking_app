import 'package:bookingapp/controller/const/const.dart';
import 'package:flutter/material.dart';

class MapWidget extends StatelessWidget {
  const MapWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: Text(
            "location",
            style:
                textStyleFuc(weight: FontWeight.w800, color: kBlack, size: 25),
          ),
        ),
      ],
    );
  }
}
