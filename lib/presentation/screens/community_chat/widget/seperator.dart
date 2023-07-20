import 'package:bookingapp/model/chatmodel.dart';
import 'package:flutter/material.dart';

// ignore: unused_element
Widget getGroupSeparator(ChatModel element) {
  String? month;
  switch (element.createdAt!.month) {
    case 1:
      month = 'Jan';
      break;
    case 2:
      month = 'Feb';
      break;
    case 3:
      month = 'March';
      break;
    case 4:
      month = 'April';
      break;
    case 5:
      month = 'May';
      break;
    case 6:
      month = 'June';
      break;
    case 7:
      month = 'July';
      break;
    case 8:
      month = 'Aug';
      break;
    case 9:
      month = 'Sept';
      break;
    case 10:
      month = 'Oct';
      break;
    case 11:
      month = 'Nov';
      break;
    case 12:
      month = 'Dec';
      break;
  }
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: SizedBox(
      height: 35,
      child: Align(
        alignment: Alignment.center,
        child: Container(
          width: 100,
          decoration: BoxDecoration(
            color: Colors.blueAccent,
            border: Border.all(
              color: Colors.blueAccent,
            ),
            borderRadius: const BorderRadius.all(Radius.circular(20.0)),
          ),
          child: Text(
            '${element.createdAt!.day}, $month, ${element.createdAt!.year}',
            textAlign: TextAlign.center,
            style: const TextStyle(color: Colors.white, fontSize: 12),
          ),
        ),
      ),
    ),
  );
}
