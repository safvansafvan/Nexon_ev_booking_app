import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../../controller/core/core.dart';

class OtpTextField extends StatelessWidget {
  const OtpTextField({super.key, this.controller});

  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 68,
      width: 64,
      child: TextFormField(
        validator: (value) {
          if (value!.isEmpty) {
            return "No";
          }
          return null;
        },
        controller: controller,
        decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: radiusTen),
        ),
        style: Theme.of(context).textTheme.titleLarge,
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        inputFormatters: [
          LengthLimitingTextInputFormatter(1),
          FilteringTextInputFormatter.digitsOnly
        ],
      ),
    );
  }
}
