import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:nexonev/controller/core/constant.dart';
import 'package:nexonev/controller/providers/group_provider/get_all_group_provider.dart';
import 'package:nexonev/presentation/widgets/text_form_common.dart';
import 'package:provider/provider.dart';

import '../screens/join_group.dart';

class PopUp extends StatelessWidget {
  const PopUp({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return PopupMenuButton(
        color: kwhite,
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
