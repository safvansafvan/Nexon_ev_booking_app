import 'package:bookingapp/controller/const/const.dart';
import 'package:bookingapp/presentation/widget/text_h.dart';
import 'package:flutter/material.dart';

class PopUpMenuOption extends StatelessWidget {
  const PopUpMenuOption({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      itemBuilder: (BuildContext context) => [
        PopupMenuItem(
          child: Row(
            children: [
              Icon(
                Icons.location_pin,
                color: kblue,
              ),
              const Text("Your Location")
            ],
          ),
        ),
        PopupMenuItem(
          child: Row(
            children: [
              Icon(
                Icons.location_pin,
                color: kred,
              ),
              const Text("Charger Plot")
            ],
          ),
        ),
        PopupMenuItem(
          child: HeadingTextWidget(
            text: "Search",
            underline: true,
          ),
        ),
        const PopupMenuItem(
          child: Text(
            "Go to top side\nSearch your place\nFind nearest charging plot",
          ),
        ),
      ],
      icon: const Icon(
        Icons.more_vert,
        color: Colors.black,
      ),
    );
  }
}
