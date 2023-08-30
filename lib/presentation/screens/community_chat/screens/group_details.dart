import 'dart:developer';
import 'package:bookingapp/controller/core/constant.dart';
import 'package:bookingapp/controller/core/strings.dart';
import 'package:bookingapp/model/group_model.dart';
import 'package:bookingapp/presentation/screens/community_chat/screens/change_group_profile.dart';
import 'package:bookingapp/presentation/widgets/text_h.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class GroupDetailsWidget extends StatelessWidget {
  GroupDetailsWidget({super.key, required this.groupData});
  Group? groupData;
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    log(groupData!.admin.toString());
    final membersList = groupData!.members.toList();
    String adminName = groupData!.admin.toString();
    RegExp regExp = RegExp(r"name: ([a-zA-Z]+)");
    Match? match = regExp.firstMatch(adminName);
    String name = match?.group(1) ?? "";

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(168, 0, 0, 0),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios_new_rounded,
            color: kwhite,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) {
                  return ChangeGroupProfile(
                      id: groupData!.id,
                      img: groupData!.image.toString(),
                      name: groupData!.groupName);
                }),
              );
            },
            icon: Icon(
              Icons.edit_outlined,
              color: kwhite,
            ),
          )
        ],
      ),
      body: ListView(
        children: [
          Container(
            width: double.infinity,
            height: screenSize.height * 0.35,
            decoration: const BoxDecoration(
              color: Color.fromARGB(168, 0, 0, 0),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10),
              ),
            ),
            child: Column(
              children: [
                groupData!.image != null
                    ? CircleAvatar(
                        radius: 80,
                        backgroundImage: NetworkImage(
                          Urls.baseUrl + groupData!.image.toString(),
                        ),
                      )
                    : const CircleAvatar(
                        radius: 70,
                        backgroundImage: NetworkImage(
                            "https://w7.pngwing.com/pngs/429/584/png-transparent-three-person-s-illustrations-computer-icons-symbol-people-network-icon-s-good-pix-gallery-miscellaneous-blue-hand-thumbnail.png"),
                      ),
                CustomHeight.heightTen(context),
                Text(
                  groupData!.groupName,
                  style: textStyleFuc(
                      weight: FontWeight.w600, color: kwhite, size: 16),
                ),
                CustomHeight.heightTen(context),
                Text(
                  "Members:${groupData!.members.length}",
                  style: textStyleFuc(
                      weight: FontWeight.w500, color: kwhite, size: 14),
                ),
                CustomHeight.heightTen(context),
                Text(
                  "Created By:$name",
                  style: textStyleFuc(
                      weight: FontWeight.w500, color: kwhite, size: 14),
                ),
              ],
            ),
          ),
          CustomHeight.heightTen(context),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: ListView(
              shrinkWrap: true,
              children: [
                HeadingTextWidget(
                  text: "Members",
                  fontWeight: FontWeight.w600,
                  textSize: 17,
                  underline: true,
                ),
                CustomHeight.heightTen(context),
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: membersList.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(top: 5),
                      child: Text(
                        membersList[index]['name'].toString(),
                        style: const TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w600),
                      ),
                    );
                  },
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
