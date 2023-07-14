import 'dart:developer';
import 'dart:io';

import 'package:bookingapp/controller/const/const.dart';
import 'package:bookingapp/controller/const/string.dart';
import 'package:bookingapp/controller/providers/group_provider/get_all_group_provider.dart';
import 'package:bookingapp/model/group_model.dart';
import 'package:bookingapp/presentation/widget/text_h.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GroupDetailsWidget extends StatelessWidget {
  const GroupDetailsWidget({super.key, required this.groupData});
  final Group? groupData;
  @override
  Widget build(BuildContext context) {
    log(groupData!.admin.toString());
    final membersList = groupData!.members.toList();
    String adminName = groupData!.admin.toString();
    RegExp regExp = RegExp(r"name: ([a-zA-Z]+)");
    Match? match = regExp.firstMatch(adminName);
    String name = match?.group(1) ?? "";
    final imageUrl = Urls.baseUrl + groupData!.image.toString();

    final provider = Provider.of<GetAllGroupsProvider>(context, listen: false);
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
              showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      shape: RoundedRectangleBorder(borderRadius: radiusTen),
                      title: const Text("Edit Group"),
                      content: SizedBox(
                        height: 280,
                        child: ListView(
                          children: [
                            provider.fileImg == null
                                ? const CircleAvatar(
                                    radius: 80,
                                    backgroundImage:
                                        AssetImage('assets/nexonEvB.png'),
                                  )
                                : CircleAvatar(
                                    radius: 70,
                                    backgroundImage: FileImage(
                                      File(provider.fileImg!.path),
                                    ),
                                  ),
                            IconButton(
                                onPressed: () {
                                  provider.getImg();
                                },
                                icon: const Icon(Icons.edit)),
                            height10,
                            TextFormField(
                              controller: provider.editGroupName,
                            )
                          ],
                        ),
                      ),
                      actions: [
                        TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text("Cancel")),
                        TextButton(
                            onPressed: () {
                              provider.editGroupNameAndImg(
                                  context,
                                  groupData!.id,
                                  provider.editGroupName.text.trim(),
                                  provider.fileImg,
                                  groupData!.image);
                            },
                            child: const Text("Ok"))
                      ],
                    );
                  });
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
            height: 250,
            decoration: const BoxDecoration(
              color: Color.fromARGB(168, 0, 0, 0),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10),
              ),
            ),
            child: Column(
              children: [
                CircleAvatar(
                  radius: 60,
                  backgroundImage: NetworkImage(imageUrl.toString()),
                ),
                height10,
                Text(
                  groupData!.groupName,
                  style: textStyleFuc(
                      weight: FontWeight.w500, color: kwhite, size: 15),
                ),
                height10,
                Text(
                  "Members:${groupData!.members.length}",
                  style: textStyleFuc(
                      weight: FontWeight.w500, color: kwhite, size: 14),
                ),
                height10,
                Text(
                  "Created By:$name",
                  style: textStyleFuc(
                      weight: FontWeight.w500, color: kwhite, size: 14),
                ),
              ],
            ),
          ),
          kHeightFive,
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
                height10,
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: membersList.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(top: 5),
                      child: Text(
                        membersList[index]['name'],
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
