import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:nexonev/controller/core/constant.dart';
import 'package:nexonev/controller/core/strings.dart';
import 'package:nexonev/controller/providers/group_provider/get_all_group_provider.dart';
import 'package:nexonev/presentation/screens/community_chat/screens/chat_screen.dart';
import 'package:provider/provider.dart';

class UserGroupListView extends StatefulWidget {
  const UserGroupListView({super.key});

  @override
  State<UserGroupListView> createState() => _UserGroupListViewState();
}

class _UserGroupListViewState extends State<UserGroupListView> {
  @override
  void initState() {
    super.initState();
    Provider.of<GetAllGroupsProvider>(context, listen: false)
        .getUserGroups(context);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<GetAllGroupsProvider>(builder: (context, value, _) {
      if (value.userGroupLoading == true) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      } else if (value.userGroups.isEmpty) {
        return SizedBox(
          height: MediaQuery.of(context).size.height * 0.15,
          child: Card(
            elevation: 6,
            child: Center(
              child: Text(
                "Your Group List Is Empty",
                style: textStyleFuc(
                  weight: FontWeight.bold,
                  color: kred,
                  size: 16,
                ),
              ),
            ),
          ),
        );
      } else {
        return ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: value.stillSearchGroup.length,
          itemBuilder: (context, index) {
            final formattedTime = DateFormat('h:mm a').format(
              value.stillSearchGroup[index].updatedAt.toLocal(),
            );
            return ListTile(
              leading: CircleAvatar(
                backgroundImage: value.stillSearchGroup[index].image != null
                    ? NetworkImage(
                        Urls.baseUrl +
                            value.stillSearchGroup[index].image.toString(),
                      )
                    : const NetworkImage(
                        "https://w7.pngwing.com/pngs/429/584/png-transparent-three-person-s-illustrations-computer-icons-symbol-people-network-icon-s-good-pix-gallery-miscellaneous-blue-hand-thumbnail.png"),
              ),
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(value.stillSearchGroup[index].groupName),
                  Text(
                    "This is the last message",
                    style: textStyleFuc(
                      weight: FontWeight.w500,
                      color: kBlack,
                      size: MediaQuery.of(context).size.width * 0.03,
                    ),
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
                        data: value.stillSearchGroup[index],
                      );
                    },
                  ),
                );
              },
            );
          },
        );
      }
    });
  }
}
