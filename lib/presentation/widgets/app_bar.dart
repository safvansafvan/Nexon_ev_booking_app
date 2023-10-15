import 'package:fluttertoast/fluttertoast.dart';
import 'package:nexonev/controller/core/constant.dart';
import 'package:nexonev/controller/providers/get_user_details.dart';
import 'package:nexonev/controller/providers/group_provider/get_all_group_provider.dart';
import 'package:nexonev/presentation/screens/community_chat/screens/join_group.dart';
import 'package:nexonev/presentation/screens/settings/settings.dart';
import 'package:nexonev/presentation/widgets/login_dialog.dart';
import 'package:nexonev/presentation/widgets/text_form_common.dart';
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
    GetUserDetials user = GetUserDetials();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await user.userLoginOrNot();
    });
    return ListTile(
        leading: menu
            ? IconButton(
                onPressed: () {
                  if (user.token == null) {
                    loginReqDialog(context);
                  } else {
                    Scaffold.of(context).openDrawer();
                  }
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

class PopUp extends StatelessWidget {
  const PopUp({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return PopupMenuButton(
        itemBuilder: (BuildContext context) => [
              PopupMenuItem(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const JoinGroupScreen(),
                  ),
                ),
                child: const Text("Join Group"),
              ),
              PopupMenuItem(
                onTap: () => dialog(context, size),
                child: const Text("Create Group"),
              ),
            ]);
  }
}

//create new group

void dialog(context, size) {
  final provider = Provider.of<GetAllGroupsProvider>(context, listen: false);
  provider.newGroupLoading
      ? const Center(
          child: CircularProgressIndicator(),
        )
      : showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              shape: RoundedRectangleBorder(borderRadius: radiusTen),
              title: const Text("New Group"),
              content: TextFormFieldCommon(
                  prefixIcon: const Icon(Icons.group),
                  controller: provider.newGroupNameController,
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
                    if (provider.newGroupNameController.text.isEmpty) {
                      Fluttertoast.showToast(msg: "Add Name");
                    } else {
                      await provider.addNewGroup(context);
                      // ignore: use_build_context_synchronously
                      Navigator.pop(context);
                    }
                  },
                  child: const Text("OK"),
                )
              ],
            );
          },
        );
}
