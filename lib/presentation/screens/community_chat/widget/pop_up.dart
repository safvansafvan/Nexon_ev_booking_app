import 'package:nexonev/controller/core/constant.dart';
import 'package:nexonev/controller/providers/group_provider/get_all_group_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void showDialogPop(context, grpName, groupId) {
  Provider.of<GetAllGroupsProvider>(context, listen: false).joinNewGrpLoading
      ? const Center(
          child: CircularProgressIndicator(),
        )
      : showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              shape: RoundedRectangleBorder(borderRadius: radiusTen),
              title: const Text("Conform"),
              content: Text("Do you want join $grpName community ?"),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text("Cancel")),
                TextButton(
                    onPressed: () {
                      Provider.of<GetAllGroupsProvider>(context, listen: false)
                          .joinGroup(context, groupId, grpName);
                    },
                    child: const Text("Ok"))
              ],
            );
          },
        );
}
