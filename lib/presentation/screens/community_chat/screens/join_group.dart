import 'package:bookingapp/controller/core/constant.dart';
import 'package:bookingapp/controller/core/strings.dart';
import 'package:bookingapp/controller/providers/group_provider/get_all_group_provider.dart';
import 'package:bookingapp/presentation/screens/community_chat/widget/pop_up.dart';
import 'package:bookingapp/presentation/widgets/text_h.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class JoinGroupScreen extends StatefulWidget {
  const JoinGroupScreen({super.key});

  @override
  State<JoinGroupScreen> createState() => _JoinGroupScreenState();
}

class _JoinGroupScreenState extends State<JoinGroupScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<GetAllGroupsProvider>(context, listen: false)
        .joinGroupButtonClick(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(9.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  children: [
                    IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(Icons.arrow_back_ios_new_rounded)),
                    kWidth,
                    HeadingTextWidget(
                      text: "Available Groups",
                      fontWeight: FontWeight.w600,
                      textSize: 18,
                    ),
                  ],
                ),
                height10,
                Consumer<GetAllGroupsProvider>(
                  builder: (context, value, _) {
                    return value.isLoading
                        ? const Center(
                            child: CircularProgressIndicator(),
                          )
                        : ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: value.userDetails.length,
                            itemBuilder: (context, index) {
                              final grpDetails = value.userDetails[index];
                              final groupId = grpDetails['_id'];
                              final imageUrl = grpDetails['image'];

                              return ListTile(
                                leading: CircleAvatar(
                                    backgroundImage: imageUrl != null
                                        ? NetworkImage(
                                            Urls.baseUrl + imageUrl,
                                          )
                                        : const NetworkImage(
                                            "https://w7.pngwing.com/pngs/429/584/png-transparent-three-person-s-illustrations-computer-icons-symbol-people-network-icon-s-good-pix-gallery-miscellaneous-blue-hand-thumbnail.png")),
                                title: Text(
                                  grpDetails['groupName'],
                                  style: textStyleFuc(
                                      weight: FontWeight.w600,
                                      color: kBlack,
                                      size: 16),
                                ),
                                trailing: IconButton(
                                    onPressed: () async {
                                      showDialogPop(context,
                                          grpDetails['groupName'], groupId);
                                    },
                                    icon: const Icon(Icons.add_outlined)),
                              );
                            },
                          );
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}