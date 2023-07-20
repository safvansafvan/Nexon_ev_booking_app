import 'package:bookingapp/controller/core/core.dart';
import 'package:bookingapp/controller/providers/group_provider/get_all_group_provider.dart';
import 'package:bookingapp/presentation/screens/community_chat/screens/join_group.dart';
import 'package:bookingapp/presentation/screens/settings/settings.dart';
import 'package:bookingapp/presentation/widget/text_form_common.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class AppBarWidget extends StatelessWidget {
  AppBarWidget(
      {super.key,
      this.title,
      required this.leading,
      this.trailing,
      required this.settings,
      required this.menu});

  final String? title;
  final IconData leading;
  final IconData? trailing;

  bool menu = false;
  bool settings = false;

  @override
  Widget build(BuildContext context) {
    return ListTile(
        leading: menu
            ? IconButton(
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
                icon: Icon(
                  Icons.menu,
                  color: kBlack,
                ),
              )
            : IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: Icon(
                  leading,
                  color: kBlack,
                )),
        title: Center(
          child: Text(
            title ?? "",
            style:
                textStyleFuc(weight: FontWeight.w600, color: kBlack, size: 20),
          ),
        ),
        trailing: settings
            ? IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SettingsScreen(),
                    ),
                  );
                },
                icon: Icon(trailing, color: kBlack),
              )
            : const PopUp());
  }
}

class PopUp extends StatefulWidget {
  const PopUp({
    super.key,
  });

  @override
  State<PopUp> createState() => _PopUpState();
}

class _PopUpState extends State<PopUp> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return PopupMenuButton(
        itemBuilder: (BuildContext context) => [
              PopupMenuItem(
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const JoinGroupScreen(),
                      ),
                    );
                  },
                  child: const Text("Join Group"),
                ),
              ),
              PopupMenuItem(
                child: TextButton(
                  onPressed: () {
                    dialog(context, size);
                  },
                  child: const Text("Create Group"),
                ),
              ),
            ]);
  }
}

//create new group

void dialog(context, size) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: radiusTen),
        title: const Text("New Group"),
        content: TextFormFieldCommon(
            controller:
                Provider.of<GetAllGroupsProvider>(context, listen: false)
                    .newGroupNameController,
            hintText: "Group name",
            keyType: TextInputType.name,
            size: size),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text("Cancel"),
          ),
          TextButton(
            onPressed: () async {
              await Provider.of<GetAllGroupsProvider>(context, listen: false)
                  .addNewGroup(context);
              // ignore: use_build_context_synchronously
              Navigator.pop(context);
            },
            child: const Text("OK"),
          )
        ],
      );
    },
  );
}
