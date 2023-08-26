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

//width
var kWidth = const SizedBox(
  width: 20,
);

// height
var kheight30 = const SizedBox(
  height: 30,
);

class CustomHeight {
  static commonHeightz(context) {
    Size size = MediaQuery.of(context).size;
    var commonHeight = SizedBox(
      height: size.height * 0.03,
    );
    return commonHeight;
  }

  static heightTen(context) {
    Size size = MediaQuery.of(context).size;
    var commonHeight = SizedBox(
      height: size.height * 0.01,
    );
    return commonHeight;
  }
}
