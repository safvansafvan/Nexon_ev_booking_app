import 'package:bookingapp/controller/const/const.dart';
import 'package:bookingapp/controller/providers/group_provider/get_all_group_provider.dart';
import 'package:bookingapp/presentation/community_chat/screens/chat_screen.dart';
import 'package:bookingapp/presentation/widget/app_bar.dart';
import 'package:bookingapp/presentation/widget/text_h.dart';
import 'package:flutter/material.dart';
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
        padding: const EdgeInsets.all(9.0),
        child: ListView(
          children: [
            height10,
            HeadingTextWidget(
              text: "Chats",
              textSize: 18,
              underline: true,
              fontWeight: FontWeight.w600,
            ),
            height10,
            Consumer<GetAllGroupsProvider>(builder: (context, value, _) {
              return value.userGroupLoading
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : ListView.builder(
                      shrinkWrap: true,
                      itemCount: value.userGroups.length,
                      itemBuilder: (context, index) {
                        final userGroup = value.userGroups[index];
                        return value.userGroups.isEmpty
                            ? const Center(
                                child: Text("data"),
                              )
                            : ListTile(
                                leading: const CircleAvatar(
                                  child: Icon(Icons.person),
                                ),
                                title: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(userGroup['groupName']),
                                    const Text("This is the last message"),
                                  ],
                                ),
                                trailing: const Text("10:10"),
                                onTap: () {
                                  Provider.of<GetAllGroupsProvider>(context,
                                          listen: false)
                                      .fetchGroupMessages(
                                          userGroup['_id'], context);
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => ChatScreen(),
                                    ),
                                  );
                                },
                              );
                      },
                    );
            })
          ],
        ),
      ),
    );
  }
}
