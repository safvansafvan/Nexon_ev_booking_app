import 'package:flutter/cupertino.dart';
import 'package:nexonev/controller/core/constant.dart';
import 'package:nexonev/controller/core/strings.dart';
import 'package:nexonev/controller/providers/group_provider/get_all_group_provider.dart';
import 'package:nexonev/presentation/screens/community_chat/screens/chat_screen.dart';
import 'package:nexonev/presentation/screens/community_chat/widget/more_pop.dart';
import 'package:nexonev/presentation/widgets/text_h.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class CommunityChatScreen extends StatelessWidget {
  const CommunityChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var queryData = MediaQuery.of(context);
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await Provider.of<GetAllGroupsProvider>(context, listen: false)
          .getUserGroups(context);
    });
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size(double.infinity, 120),
        child: ColoredBox(
          color: kblue,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AppBar(
                backgroundColor: kblue,
                leading: IconButton(
                    onPressed: () => Navigator.of(context).pop(),
                    icon:
                        Icon(Icons.arrow_back_ios_new_rounded, color: kwhite)),
                title: HeadingTextWidget(
                  text: " Groups",
                  textSize: 19,
                  color: kwhite,
                  fontWeight: FontWeight.w600,
                ),
                actions: const [PopUp()],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0),
                child: CupertinoSearchTextField(
                  backgroundColor: Colors.amber[50],
                  placeholderStyle: const TextStyle(
                    color: Colors.blue,
                  ),
                  itemColor: Colors.blue,
                  style: const TextStyle(color: Colors.blue),
                ),
              ),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: SingleChildScrollView(
          child: Column(
            children: [
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
                          : FutureBuilder(
                              future: Provider.of<GetAllGroupsProvider>(context,
                                      listen: false)
                                  .getUserGroups(context),
                              builder: (context, snapshot) {
                                return ListView.builder(
                                  physics: const NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  itemCount: value.userGroups.length,
                                  itemBuilder: (context, index) {
                                    final formattedTime =
                                        DateFormat('h:mm a').format(
                                      value.userGroups[index].updatedAt
                                          .toLocal(),
                                    );

                                    return ListTile(
                                      leading: CircleAvatar(
                                        backgroundImage: value
                                                    .userGroups[index].image !=
                                                null
                                            ? NetworkImage(
                                                Urls.baseUrl +
                                                    value
                                                        .userGroups[index].image
                                                        .toString(),
                                              )
                                            : const NetworkImage(
                                                "https://w7.pngwing.com/pngs/429/584/png-transparent-three-person-s-illustrations-computer-icons-symbol-people-network-icon-s-good-pix-gallery-miscellaneous-blue-hand-thumbnail.png"),
                                      ),
                                      title: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(value
                                              .userGroups[index].groupName),
                                          Text(
                                            "This is the last message",
                                            style: textStyleFuc(
                                                weight: FontWeight.w500,
                                                color: kBlack,
                                                size: queryData.size.width *
                                                    0.03),
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
                              });
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
