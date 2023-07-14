import 'dart:async';
import 'dart:developer';
import 'package:bookingapp/controller/const/string.dart';
import 'package:bookingapp/presentation/community_chat/screens/group_details.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:bookingapp/model/chatmodel.dart';
import 'package:bookingapp/model/group_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sticky_grouped_list/sticky_grouped_list.dart';
import 'package:bookingapp/controller/providers/group_provider/chat_provider.dart';
import 'package:bookingapp/presentation/community_chat/widget/msg_card/own_msg.dart';
import 'package:bookingapp/presentation/community_chat/widget/msg_card/reply_card.dart';
import 'package:bookingapp/presentation/community_chat/widget/msg_sending_widget.dart';
import 'package:bookingapp/presentation/community_chat/widget/seperator.dart';
import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key, required this.data}) : super(key: key);
  final Group data;

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  late Timer timer;
  StreamController<List<ChatModel>> controller =
      StreamController<List<ChatModel>>.broadcast();
  String userName = "";
  @override
  void initState() {
    super.initState();
    getUsername();
  }

  @override
  void didChangeDependencies() {
    timer = Timer.periodic(const Duration(seconds: 2), (_) {
      Provider.of<ChatProvider>(context, listen: false).getMessages(context);
    });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<ChatProvider>(context, listen: false).groupId =
          widget.data.id;
      Provider.of<ChatProvider>(context, listen: false).connect();
      Provider.of<ChatProvider>(context, listen: false).getMessages(context);
    });

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size(double.infinity, 100),
        child: AppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back_ios_new_rounded)),
          title: Row(
            children: [
              widget.data.image != null
                  ? CircleAvatar(
                      radius: 25,
                      backgroundImage: NetworkImage(
                        Urls.baseUrl + widget.data.image.toString(),
                      ),
                    )
                  : const CircleAvatar(
                      radius: 25,
                      backgroundImage: NetworkImage(
                          "https://w7.pngwing.com/pngs/429/584/png-transparent-three-person-s-illustrations-computer-icons-symbol-people-network-icon-s-good-pix-gallery-miscellaneous-blue-hand-thumbnail.png")),
              const SizedBox(width: 10),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => GroupDetailsWidget(
                        groupData: widget.data,
                      ),
                    ),
                  );
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(widget.data.groupName),
                    const Text(
                      'Click here for group info',
                      style: TextStyle(fontSize: 12),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      body: Consumer<ChatProvider>(builder: (context, value, _) {
        controller = value.listMsg;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Expanded(
              child: StreamBuilder<List<ChatModel>>(
                stream: controller.stream,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    final data = snapshot.data!.reversed.toList();
                    if (data.length > 7) {
                      return StickyGroupedListView<ChatModel, DateTime>(
                        order: StickyGroupedListOrder.DESC,
                        floatingHeader: true,
                        reverse: true,
                        elements: data.reversed.toList(),
                        groupBy: (ChatModel element) => DateTime(
                            element.createdAt!.year,
                            element.createdAt!.month,
                            element.createdAt!.day),
                        groupSeparatorBuilder: getGroupSeparator,
                        indexedItemBuilder: (context, element, index) {
                          if (data[index].name!.name == userName) {
                            return OwnMessageCard(
                              text: data[index].text.toString(),
                              name: data[index].name!.name.toString(),
                              time: data[index].createdAt,
                              date: false,
                            );
                          } else {
                            log("  $userName");
                            return ReplyCard(
                              name: data[index].name!.name.toString(),
                              text: data[index].text.toString(),
                              time: data[index].createdAt,
                              date: false,
                            );
                          }
                        },
                      );
                    } else {
                      return ListView.builder(
                        reverse: true,
                        itemCount: data.length,
                        itemBuilder: (context, index) {
                          // ignore: unrelated_type_equality_checks
                          if (data[index].name!.name == userName) {
                            return OwnMessageCard(
                              text: data[index].text.toString(),
                              name: data[index].name!.name.toString(),
                              time: data[index].createdAt,
                              date: true,
                            );
                          } else {
                            log("${data[index].name!.name}  $userName");
                            return ReplyCard(
                              name: data[index].name!.name.toString(),
                              text: data[index].text.toString(),
                              time: data[index].createdAt,
                              date: true,
                            );
                          }
                        },
                      );
                    }
                  } else if (snapshot.hasError) {
                    return const Center(child: CircularProgressIndicator());
                  } else {
                    return const Center(child: CircularProgressIndicator());
                  }
                },
              ),
            ),
            MsgSendingWidget(widget: widget, value: value),
            Offstage(
              offstage: value.emojiShowing,
              child: SizedBox(
                height: 250,
                child: EmojiPicker(
                  textEditingController: value.textController,
                  config: const Config(
                    columns: 7,
                    verticalSpacing: 0,
                    horizontalSpacing: 0,
                    gridPadding: EdgeInsets.zero,
                    initCategory: Category.RECENT,
                    bgColor: Color(0xFFF2F2F2),
                    indicatorColor: Colors.blue,
                    iconColor: Colors.grey,
                    iconColorSelected: Colors.blue,
                    backspaceColor: Colors.blue,
                    skinToneDialogBgColor: Colors.white,
                    skinToneIndicatorColor: Colors.grey,
                    enableSkinTones: true,
                    recentTabBehavior: RecentTabBehavior.RECENT,
                    recentsLimit: 28,
                    replaceEmojiOnLimitExceed: false,
                    noRecents: Text(
                      'No Recents',
                      style: TextStyle(fontSize: 20, color: Colors.black26),
                      textAlign: TextAlign.center,
                    ),
                    loadingIndicator: SizedBox.shrink(),
                    tabIndicatorAnimDuration: kTabScrollDuration,
                    categoryIcons: CategoryIcons(),
                    buttonMode: ButtonMode.MATERIAL,
                    checkPlatformCompatibility: true,
                  ),
                ),
              ),
            ),
          ],
        );
      }),
    );
  }

  getUsername() async {
    final pref = await SharedPreferences.getInstance();
    userName = pref.getString("USER_NAME").toString();
    log(userName, name: "futions");
  }
}
