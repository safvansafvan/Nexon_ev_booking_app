import 'dart:developer';

import 'package:bookingapp/controller/const/const.dart';
import 'package:bookingapp/presentation/community_chat/community_chat.dart';
import 'package:bookingapp/presentation/map/location.dart';
import 'package:flutter/material.dart';

class PopularOptionsWidges extends StatelessWidget {
  const PopularOptionsWidges({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 5, right: 5, top: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            children: [
              InkWell(
                onTap: () {
                  log("touched00", name: "location");
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const MyWidget(),
                    ),
                  );
                },
                child: Container(
                  width: 150,
                  height: 150,
                  decoration: BoxDecoration(
                    image: const DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage("assets/locations.webp"),
                    ),
                    border: Border.all(color: Colors.grey),
                    borderRadius: radiusTen,
                  ),
                ),
              ),
              const SizedBox(height: 5),
              Text(
                'Location',
                style: TextStyle(
                    fontSize: 16, fontWeight: FontWeight.w500, color: kBlack),
              ),
            ],
          ),
          Column(
            children: [
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const CommunityChatScreen(),
                    ),
                  );
                },
                child: Container(
                  width: 150,
                  height: 150,
                  decoration: BoxDecoration(
                    image: const DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage("assets/community.jpeg"),
                    ),
                    border: Border.all(color: Colors.grey),
                    borderRadius: radiusTen,
                  ),
                ),
              ),
              kHeightFive,
              Text(
                'Community',
                style: TextStyle(
                    fontSize: 16, fontWeight: FontWeight.w500, color: kBlack),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
