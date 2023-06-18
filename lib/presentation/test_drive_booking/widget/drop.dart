import 'package:bookingapp/model/dealer/dealer_model.dart';
import 'package:flutter/material.dart';

class CustomDropdowns extends StatelessWidget {
  final bool excludeSelected;
  final Color fillColor;
  final String hintText;
  final TextStyle hintStyle;
  final TextStyle selectedStyle;
  final List<Dealer> items;
  final TextEditingController controller;

  const CustomDropdowns({
    required this.excludeSelected,
    required this.fillColor,
    required this.hintText,
    required this.hintStyle,
    required this.selectedStyle,
    required this.items,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<Dealer>(
      value: controller.text.isNotEmpty
          ? items.firstWhere(
              (dealer) => dealer.dealerName == controller.text,
              orElse: () => items[0],
            )
          : null,
      decoration: InputDecoration(
        filled: true,
        fillColor: fillColor,
      ),
      hint: Text(
        hintText,
        style: hintStyle,
      ),
      style: selectedStyle,
      items: excludeSelected
          ? items
              .where((dealer) => dealer.dealerName != controller.text)
              .map<DropdownMenuItem<Dealer>>((dealer) {
              return DropdownMenuItem<Dealer>(
                value: dealer,
                child: Text(dealer.dealerName),
              );
            }).toList()
          : items.map<DropdownMenuItem<Dealer>>((dealer) {
              return DropdownMenuItem<Dealer>(
                value: dealer,
                child: Text(dealer.dealerName),
              );
            }).toList(),
      onChanged: (selectedDealer) {
        controller.text = selectedDealer!.dealerName;
      },
    );
  }
}
