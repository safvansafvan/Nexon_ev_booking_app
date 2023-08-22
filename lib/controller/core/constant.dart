import 'package:flutter/material.dart';

var kwhite = Colors.white;
var kBlack = Colors.black;
var kBlack38 = Colors.black38;
var kred = Colors.red;
var kblue = Colors.blueAccent;
var kGreen = const Color.fromARGB(255, 139, 180, 92);

var loginBackground = Colors.grey[300];

//fuction

textStyleFuc({required weight, required color, required double size}) {
  return TextStyle(fontSize: size, fontWeight: weight, color: color);
}

//radius

var radiusTen = BorderRadius.circular(11);

var height10 = const SizedBox(
  height: 10,
);

//height
var commonHeight = const SizedBox(
  height: 20,
);
var kHeight15 = const SizedBox(
  height: 15,
);
var kheight30 = const SizedBox(
  height: 30,
);
var kHeightFive = const SizedBox(
  height: 5,
);

//width
var kWidth = const SizedBox(
  width: 20,
);

class CustomHeight {
  static commonHeightz(context) {
    Size size = MediaQuery.of(context).size;
    var commonHeight = SizedBox(
      height: size.height * 0.03,
    );
    return commonHeight;
  }
}
