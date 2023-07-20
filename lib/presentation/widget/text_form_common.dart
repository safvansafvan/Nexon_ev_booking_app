import 'package:bookingapp/controller/core/core.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TextFormFieldCommon extends StatelessWidget {
  TextFormFieldCommon(
      {super.key,
      required this.controller,
      required this.hintText,
      required this.keyType,
      required this.size,
      this.prefixIcon,
      this.maxlength,
      this.suffixIcon});

  final String hintText;
  final Size size;
  final TextInputType keyType;
  final dynamic prefixIcon;
  final dynamic suffixIcon;
  final dynamic maxlength;
  TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    final border = OutlineInputBorder(
        borderRadius: radiusTen, borderSide: BorderSide(color: kblue));
    return TextFormField(
      controller: controller,
      maxLength: maxlength,
      keyboardType: keyType,
      validator: (value) {
        if (value!.isEmpty) {
          return "Required";
        }
        return null;
      },
      decoration: InputDecoration(
          prefixIconColor: kBlack,
          prefixIcon: prefixIcon,
          suffixIconColor: kBlack,
          suffixIcon: suffixIcon,
          hintText: hintText,
          hintStyle: TextStyle(color: kBlack),
          border: border,
          enabledBorder: border,
          focusedBorder: border,
          disabledBorder: border),
      style: TextStyle(
        fontSize: size.width * 0.045,
        color: kBlack,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
