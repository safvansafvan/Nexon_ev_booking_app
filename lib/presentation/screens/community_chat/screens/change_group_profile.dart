import 'dart:io';
import 'package:bookingapp/controller/core/constant.dart';
import 'package:bookingapp/controller/providers/group_provider/get_all_group_provider.dart';
import 'package:bookingapp/presentation/widget/text_form_common.dart';
import 'package:bookingapp/presentation/widget/text_h.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class ChangeGroupProfile extends StatelessWidget {
  const ChangeGroupProfile(
      {super.key, required this.name, required this.img, required this.id});
  final String name;
  final String img;
  final String id;
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final provider = Provider.of<GetAllGroupsProvider>(context);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                height10,
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.arrow_back_ios_new_rounded),
                    ),
                    HeadingTextWidget(
                      text: "Edit Group Details",
                      color: kBlack,
                      fontWeight: FontWeight.w600,
                      textSize: 18,
                      underline: true,
                    ),
                  ],
                ),
                kheight30,
                provider.fileImg == null
                    ? Align(
                        alignment: Alignment.center,
                        child: Container(
                          height: 250,
                          width: 250,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              border: Border.all(color: kblue),
                              image: const DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(
                                      "https://w7.pngwing.com/pngs/429/584/png-transparent-three-person-s-illustrations-computer-icons-symbol-people-network-icon-s-good-pix-gallery-miscellaneous-blue-hand-thumbnail.png"))),
                        ),
                      )
                    : Align(
                        alignment: Alignment.center,
                        child: Container(
                          height: 250,
                          width: 250,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            image: DecorationImage(
                              image: FileImage(
                                File(provider.fileImg!.path),
                              ),
                            ),
                          ),
                        ),
                      ),
                TextButton(
                  onPressed: () {
                    provider.getImg();
                  },
                  child: const Text("Click"),
                ),
                TextFormFieldCommon(
                    controller: provider.editGroupName,
                    hintText: name,
                    keyType: TextInputType.name,
                    size: screenSize),
                kheight30,
                ElevatedButton.icon(
                  onPressed: () {
                    provider.editGroupNameAndImg(
                        context,
                        id,
                        provider.editGroupName.text.isEmpty
                            ? name
                            : provider.editGroupName.text.trim(),
                        provider.fileImg,
                        img);
                  },
                  label: const Text("Conform"),
                  icon: const Icon(Icons.check),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
