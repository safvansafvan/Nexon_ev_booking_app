import 'package:flutter/material.dart';

var kwhite = Colors.white;
var kBlack = Colors.black;
var kBlack38 = Colors.black38;
var kred = Colors.red;
var kblue = Colors.blueAccent;
var kGreen = const Color.fromARGB(255, 139, 180, 92);

//fuction

textStyleFuc({required weight, required color, required double size}) {
  return TextStyle(fontSize: size, fontWeight: weight, color: color);
}

//radius

var radiusTen = BorderRadius.circular(11);

var height10 = const SizedBox(
  height: 10,
);

var commonHeight = const SizedBox(
  height: 20,
);
var kheight30 = const SizedBox(
  height: 30,
);
var kHeightFive = const SizedBox(
  height: 5,
);
