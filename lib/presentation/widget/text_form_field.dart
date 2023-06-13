import 'package:bookingapp/controller/providers/login.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../controller/const/const.dart';

// TextEditingController _passController = TextEditingController();
// TextEditingController get passController => _passController;

FocusNode focusNode = FocusNode();

class TextFormCommon extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final TextInputType keyType;
  final bool isPassword;
  final bool isEmail;
  final bool isPhone;
  final bool isUser;
  final bool isObs;
  final Size size;
  final dynamic prefixIcon;
  final dynamic maxlength;
  const TextFormCommon(
      {super.key,
      required this.prefixIcon,
      required this.controller,
      required this.hintText,
      required this.keyType,
      required this.size,
      this.isPassword = false,
      this.isEmail = false,
      this.isPhone = false,
      this.isUser = false,
      this.isObs = false,
      this.maxlength});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<LoginProvider>().passwordVisibility;
    return TextFormField(
      maxLength: maxlength,
      controller: controller,
      keyboardType: keyType,
      validator: (value) {
        if (isUser) {
          if (value == null || value.isEmpty) {
            return "Username is required";
          }
        }
        if (isPhone) {
          if (value == null || value.isEmpty) {
            return "Phonenumber is required";
          } else if (value.length != 10) {
            return "Enter a valid Phonenumber";
          }
        }
        if (isPassword) {
          if (value == null || value.isEmpty) {
            return "Password is required";
          }
        }

        if (isEmail) {
          if (value != null && !EmailValidator.validate(value)) {
            return "Enter valid email";
          }
        }
        return null;
      },
      decoration: InputDecoration(
        prefixIconColor: kBlack,
        prefixIcon: prefixIcon,
        suffixIconColor: kBlack,
        suffixIcon: isPassword
            ? IconButton(
                splashRadius: 4,
                onPressed: () {
                  context.read<LoginProvider>().showPassword();
                },
                icon: provider
                    ? const Icon(Icons.visibility_off)
                    : const Icon(Icons.visibility),
              )
            : const SizedBox(),
        counterStyle: TextStyle(color: kBlack),
        hintText: hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      style: TextStyle(
        fontSize: size.width * 0.045,
        color: kBlack,
        fontWeight: FontWeight.bold,
      ),
      obscureText: isPassword ? provider : false,
    );
  }
}
