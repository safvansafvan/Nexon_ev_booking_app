import 'package:bookingapp/controller/const/const.dart';
import 'package:bookingapp/controller/const/string.dart';
import 'package:bookingapp/controller/providers/group_provider/get_all_group_provider.dart';
import 'package:bookingapp/presentation/community_chat/screens/chat_screen.dart';
import 'package:bookingapp/presentation/widget/app_bar.dart';
import 'package:bookingapp/presentation/widget/text_h.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class CommunityChatScreen extends StatelessWidget {
  const CommunityChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<GetAllGroupsProvider>(context, listen: false)
          .getUserGroups(context);
    });
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size(double.infinity, 50),
        child: SafeArea(
          child: AppBarWidget(
            leading: Icons.arrow_back_ios_new_rounded,
            menu: false,
            title: "Community",
            trailing: Icons.more_vert_outlined,
            settings: false,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              height10,
              Align(
                alignment: Alignment.centerLeft,
                child: HeadingTextWidget(
                  text: " Groups",
                  textSize: 19,
                  fontWeight: FontWeight.w600,
                ),
              ),
              height10,
              Consumer<GetAllGroupsProvider>(
                builder: (context, value, _) {
                  return value.userGroupLoading
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : value.userGroups.isEmpty
                          ? SizedBox(
                              height: 100,
                              width: 400,
                              child: Card(
                                elevation: 6,
                                child: Center(
                                  child: Text(
                                    "Your Group List Is Empty",
                                    style: textStyleFuc(
                                        weight: FontWeight.bold,
                                        color: kred,
                                        size: 16),
                                  ),
                                ),
                              ),
                            )
                          : ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: value.userGroups.length,
                              itemBuilder: (context, index) {
                                final formattedTime = DateFormat('h:mm a')
                                    .format(value.userGroups[index].updatedAt
                                        .toLocal());
                                return ListTile(
                                  leading: value.userGroups[index].image != null
                                      ? CircleAvatar(
                                          backgroundImage: NetworkImage(
                                            Urls.baseUrl +
                                                value.userGroups[index].image
                                                    .toString(),
                                          ),
                                        )
                                      : const CircleAvatar(
                                          backgroundImage: NetworkImage(
                                              "https://w7.pngwing.com/pngs/429/584/png-transparent-three-person-s-illustrations-computer-icons-symbol-people-network-icon-s-good-pix-gallery-miscellaneous-blue-hand-thumbnail.png"),
                                        ),
                                  title: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(value.userGroups[index].groupName),
                                      Text(
                                        "This is the last message",
                                        style: textStyleFuc(
                                            weight: FontWeight.w500,
                                            color: kBlack,
                                            size: 13),
                                      ),
                                    ],
                                  ),
                                  trailing: Text(formattedTime.toString()),
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) {
                                          return ChatScreen(
                                            data: value.userGroups[index],
                                          );
                                        },
                                      ),
                                    );
                                  },
                                );
                              },
                            );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
