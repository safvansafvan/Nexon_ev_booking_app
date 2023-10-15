import 'package:nexonev/controller/core/constant.dart';
import 'package:nexonev/presentation/widgets/text_h.dart';
import 'package:flutter/material.dart';

class PopUpMenuOption extends StatelessWidget {
  const PopUpMenuOption({super.key});

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
        const PopupMenuItem(
          child: Row(
            children: [
              Icon(
                Icons.location_pin,
                color: Color.fromARGB(255, 26, 90, 217),
              ),
              Text("Tata Stations")
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
              const Text("KSEB Stations")
            ],
          ),
        ),
        const PopupMenuItem(
          child: Row(
            children: [
              Icon(
                Icons.location_pin,
                color: Color.fromARGB(200, 87, 102, 100),
              ),
              Text("Ather Stations")
            ],
          ),
        ),
        const PopupMenuItem(
          child: Row(
            children: [
              Icon(
                Icons.location_pin,
                color: Color.fromARGB(255, 11, 185, 168),
              ),
              Text("Other Stations")
            ],
          ),
        ),
        PopupMenuItem(
          child: HeadingTextWidget(
            text: "Search",
            fontWeight: FontWeight.w600,
            textSize: 15,
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
