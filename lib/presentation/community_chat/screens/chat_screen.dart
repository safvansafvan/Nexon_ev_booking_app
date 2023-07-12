import 'dart:async';
import 'package:bookingapp/controller/const/string.dart';
import 'package:bookingapp/controller/providers/group_provider/chat_provider.dart';
import 'package:bookingapp/model/chatmodel.dart';
import 'package:bookingapp/model/group_model.dart';
import 'package:bookingapp/presentation/community_chat/widget/group_details.dart';
import 'package:bookingapp/presentation/community_chat/widget/msg_bubble.dart';
import 'package:bookingapp/presentation/community_chat/widget/reply_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sticky_grouped_list/sticky_grouped_list.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key, required this.data}) : super(key: key);
  final Group data;

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  late Timer timer;
  bool emojiShowing = false;
  StreamController<List<ChatModel>> controller =
      StreamController<List<ChatModel>>.broadcast();
  @override
  void didChangeDependencies() {
    timer = Timer.periodic(const Duration(seconds: 2), (_) {
      Provider.of<ChatProvider>(context, listen: false).getMessages(context);
    });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
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
                          Urls.baseUrl + widget.data.image.toString()))
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
                        groupSeparatorBuilder: _getGroupSeparator,
                        indexedItemBuilder: (context, element, index) {
                          if (data[index].name == value.getUserEmail()) {
                            return OwnMessageCard(
                              text: data[index].text.toString(),
                              name: data[index].name!.name.toString(),
                              time: data[index].createdAt,
                              date: false,
                            );
                          } else {
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
                          if (data[index].name == value.getUserEmail) {
                            return OwnMessageCard(
                              text: data[index].text.toString(),
                              name: data[index].name!.name.toString(),
                              time: data[index].createdAt,
                              date: true,
                            );
                          } else {
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
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              color: Colors.grey[200],
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {
                      setState(() {
                        emojiShowing = !emojiShowing;
                      });
                    },
                    icon: const Icon(Icons.emoji_emotions),
                  ),
                  Expanded(
                    child: TextFormField(
                      controller: value.textController,
                      decoration: const InputDecoration.collapsed(
                        hintText: 'Type your message...',
                      ),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.send),
                    onPressed: () async {
                      value.sendMsg(
                          message: value.textController.text,
                          groupId: widget.data.id);
                    },
                  ),
                ],
              ),
            ),
            // if (emojiShowing)
            //   SizedBox(
            //     height: 200,
            //     child: EmojiPicker(
            //       textEditingController: value.textController,
            //       config: Config(
            //         columns: 7,
            //         initCategory: Category.ANIMALS,
            //         noRecents: const Text("No recents"),
            //         emojiSizeMax: 32 * (Platform.isAndroid ? 1.30 : 1.0),
            //       ),
            //     ),
            //   ),
          ],
        );
      }),
    );
  }
}

Widget _getGroupSeparator(ChatModel element) {
  String? month;
  switch (element.createdAt!.month) {
    case 1:
      month = 'Jan';
      break;
    case 2:
      month = 'Feb';
      break;
    case 3:
      month = 'March';
      break;
    case 4:
      month = 'April';
      break;
    case 5:
      month = 'May';
      break;
    case 6:
      month = 'June';
      break;
    case 7:
      month = 'July';
      break;
    case 8:
      month = 'Aug';
      break;
    case 9:
      month = 'Sept';
      break;
    case 10:
      month = 'Oct';
      break;
    case 11:
      month = 'Nov';
      break;
    case 12:
      month = 'Dec';
      break;
  }
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: SizedBox(
      height: 35,
      child: Align(
        alignment: Alignment.center,
        child: Container(
          width: 100,
          decoration: BoxDecoration(
            color: Colors.blueAccent,
            border: Border.all(
              color: Colors.blueAccent,
            ),
            borderRadius: const BorderRadius.all(Radius.circular(20.0)),
          ),
          child: Text(
            '${element.createdAt!.day}, $month, ${element.createdAt!.year}',
            textAlign: TextAlign.center,
            style: const TextStyle(color: Colors.white, fontSize: 12),
          ),
        ),
      ),
    ),
  );
}
