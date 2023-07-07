import 'package:bookingapp/controller/const/const.dart';
import 'package:bookingapp/controller/providers/group_provider/get_all_group_provider.dart';
import 'package:bookingapp/presentation/widget/text_h.dart';
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
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios_new_rounded)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(9.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              HeadingTextWidget(
                text: "Available Groups",
                fontWeight: FontWeight.w600,
                textSize: 16,
                underline: true,
              ),
              height10,
              Consumer<GetAllGroupsProvider>(builder: (context, value, _) {
                return value.isLoading
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : ListView.builder(
                        shrinkWrap: true,
                        itemCount: value.userDetails.length,
                        itemBuilder: (context, index) {
                          final grpDetails = value.userDetails[index];
                          final groupId = grpDetails['_id'];
                          final imageUrl = grpDetails['image'];

                          return ListTile(
                            leading: CircleAvatar(
                              child: imageUrl != null
                                  ? Image.network(
                                      imageUrl,
                                      fit: BoxFit.cover,
                                      errorBuilder:
                                          (context, error, stackTrace) {
                                        return const Icon(Icons.error);
                                      },
                                    )
                                  : const Icon(Icons.person),
                            ),
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
              })
            ],
          ),
        ),
      ),
    );
  }
}

void showDialogPop(context, grpName, groupId) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text("Are You Sure"),
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
                Navigator.pop(context);
              },
              child: const Text("Ok"))
        ],
      );
    },
  );
}
