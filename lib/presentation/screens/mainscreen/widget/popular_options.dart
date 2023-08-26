import 'dart:developer';
import 'package:bookingapp/controller/core/constant.dart';
import 'package:bookingapp/controller/providers/get_user_details.dart';
import 'package:bookingapp/presentation/screens/community_chat/community_chat.dart';
import 'package:bookingapp/presentation/screens/map/map_screen.dart';
import 'package:bookingapp/presentation/widgets/login_dialog.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PopularOptionsWidges extends StatelessWidget {
  const PopularOptionsWidges({super.key});

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<GetUserDetials>(context, listen: false);
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await user.userLoginOrNot();
    });
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
                  if (user.token == null) {
                    loginReqDialog(context);
                  } else {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const MapScreen(),
                      ),
                    );
                  }
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
                    fontSize: 16, fontWeight: FontWeight.w600, color: kBlack),
              ),
            ],
          ),
          Column(
            children: [
              InkWell(
                onTap: () {
                  if (user.token == null) {
                    loginReqDialog(context);
                  } else {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const CommunityChatScreen(),
                      ),
                    );
                  }
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
              CustomHeight.heightTen(context),
              Text(
                'Community',
                style: TextStyle(
                    fontSize: 16, fontWeight: FontWeight.w600, color: kBlack),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
