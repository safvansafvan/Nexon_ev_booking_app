import 'package:bookingapp/controller/core/constant.dart';
import 'package:bookingapp/presentation/screens/authentication/login.dart';
import 'package:flutter/material.dart';

void loginReqDialog(context) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: radiusTen),
        title: const Text("Login"),
        content: const Text("Your Login Is Required"),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text("Cancel"),
          ),
          TextButton(
            onPressed: () {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LoginPage(),
                  ),
                  (route) => false);
            },
            child: const Text("Ok"),
          ),
        ],
      );
    },
  );
}
