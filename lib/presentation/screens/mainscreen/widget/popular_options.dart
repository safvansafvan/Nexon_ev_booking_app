import 'dart:developer';
import 'package:nexonev/controller/core/constant.dart';
import 'package:nexonev/controller/providers/get_user_details.dart';
import 'package:nexonev/controller/providers/internet_provider.dart';
import 'package:nexonev/presentation/screens/community_chat/community_chat.dart';
import 'package:nexonev/presentation/screens/map/map_screen.dart';
import 'package:nexonev/presentation/widgets/login_dialog.dart';
import 'package:flutter/material.dart';
import 'package:nexonev/presentation/widgets/snack_bar.dart';
import 'package:provider/provider.dart';

class PopularOptionsWidges extends StatelessWidget {
  const PopularOptionsWidges({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final user = Provider.of<GetUserDetials>(context, listen: false);
    final internet = Provider.of<InternetController>(context, listen: false);
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await user.userLoginOrNot();
      await internet.checkConnection();
    });
    return Padding(
      padding: const EdgeInsets.only(left: 5, right: 5, top: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            child: Column(
              children: [
                InkWell(
                  onTap: () {
                    log("touched00", name: "location");
                    if (user.token == null) {
                      loginReqDialog(context);
                    } else {
                      if (internet.hasInternet == false) {
                        snackBarWidget(
                            context: context,
                            title: 'Enable Internet Connection',
                            clr: kGreen);
                      } else {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const MapScreen(),
                          ),
                        );
                      }
                    }
                  },
                  child: Container(
                    width: size.width * 0.37,
                    height: size.height * 0.22,
                    decoration: BoxDecoration(
                      image: const DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage("assets/images/locations.webp"),
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
          ),
          Expanded(
            child: Column(
              children: [
                InkWell(
                  onTap: () {
                    if (user.token == null) {
                      loginReqDialog(context);
                    } else {
                      if (internet.hasInternet == false) {
                        snackBarWidget(
                            context: context,
                            title: 'Enable Internet Connection',
                            clr: kGreen);
                      } else {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const CommunityChatScreen(),
                          ),
                        );
                      }
                    }
                  },
                  child: Container(
                    width: size.width * 0.37,
                    height: size.height * 0.22,
                    decoration: BoxDecoration(
                      image: const DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage("assets/images/community.jpeg"),
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
          ),
        ],
      ),
    );
  }
}
