import 'package:bookingapp/controller/core/constant.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class LocationPopup extends StatelessWidget {
  final String name;
  final String description;
  final String type;
  final DateTime date;

  const LocationPopup(
      {super.key,
      required this.name,
      required this.description,
      required this.type,
      required this.date});

  @override
  Widget build(BuildContext context) {
    final formatedDate = DateFormat.yMEd().format(date);
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 5,
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 4,
            width: 35,
            decoration: BoxDecoration(
                color: kBlack38, borderRadius: BorderRadius.circular(10)),
          ),
          kHeightFive,
          Text(
            "Name: $name",
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          height10,
          Text("Type: $type"),
          height10,
          Text("description: $description"),
          height10,
          Text("Created At: $formatedDate"),
        ],
      ),
    );
  }
}
