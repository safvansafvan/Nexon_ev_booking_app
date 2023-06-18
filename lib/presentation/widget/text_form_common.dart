import 'package:bookingapp/controller/const/const.dart';
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
        prefixIconColor: kwhite,
        prefixIcon: prefixIcon,
        suffixIconColor: kwhite,
        suffixIcon: suffixIcon,
        counterStyle: TextStyle(color: kwhite),
        hintText: hintText,
        hintStyle: TextStyle(color: kwhite),
        border: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.blue),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      style: TextStyle(
        fontSize: size.width * 0.045,
        color: kwhite,
        fontWeight: FontWeight.w400,
      ),
    );
  }
}
