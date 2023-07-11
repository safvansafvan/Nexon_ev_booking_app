import 'dart:async';
import 'dart:developer';
import 'package:bookingapp/controller/const/string.dart';
import 'package:bookingapp/controller/providers/group_provider/get_all_group_provider.dart';
import 'package:bookingapp/model/group_model.dart';
import 'package:bookingapp/presentation/community_chat/widget/group_details.dart';
import 'package:bookingapp/presentation/community_chat/widget/msg_bubble.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key, required this.data}) : super(key: key);
  final Group data;

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  late Timer timer;
  late IO.Socket socket;
  final TextEditingController msgSendController = TextEditingController();
  List<Map<String, dynamic>> messages = [];

  @override
  void initState() {
    super.initState();
    Provider.of<GetAllGroupsProvider>(context, listen: false)
        .fetchGroupMessages(groupId: widget.data.id);

    connectToSocket();
  }

  @override
  void dispose() {
    socket.disconnect();
    super.dispose();
  }

  void connectToSocket() {
    socket = IO.io(Urls.baseUrl, <String, dynamic>{
      'transports': ['websocket'],
    });

    socket.onConnect((_) {
      log('Connected');
      socket.on('messages', onMessageReceived);
    });

    socket.onDisconnect((_) {
      log('Disconnected');
    });
  }

  void onMessageReceived(data) {
    setState(() {
      messages.add(data);
    });
  }

  Future<void> sendMessage() async {
    final provider = Provider.of<GetAllGroupsProvider>(context, listen: false);
    final name = await provider.getUsername();
    final messageText = msgSendController.text;
    final groupId = widget.data.id;

    final messageData = {
      'name': name,
      'text': messageText,
      'groupId': groupId,
    };

    socket.emit('messages', messageData);

    setState(() {
      messages.add(messageData);
    });

    msgSendController.clear();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<GetAllGroupsProvider>(context);
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size(double.infinity, 100),
        child: AppBar(
          title: Row(
            children: [
              const CircleAvatar(radius: 25),
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
      body: Column(
        children: [
          Expanded(
            child: Consumer<GetAllGroupsProvider>(builder: (context, value, _) {
              return value.isMsgLoading
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : ListView.builder(
                      itemCount: value.messages.length + messages.length,
                      itemBuilder: (context, index) {
                        if (index < value.messages.length) {
                          final message = value.messages[index];
                          return MessageBubble(
                            message: message['text'],
                            isMe: false,
                            name: message['name']['name'],
                          );
                        } else {
                          final sentMessage =
                              messages[index.toInt() - value.messages.length];

                          return MessageBubble(
                            message: sentMessage['text'],
                            isMe: true,
                            name: sentMessage['name'],
                          );
                        }
                      },
                    );
            }),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            color: Colors.grey[200],
            child: Row(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.emoji_emotions),
                ),
                Expanded(
                  child: TextFormField(
                    controller: msgSendController,
                    decoration: const InputDecoration.collapsed(
                      hintText: 'Type your message...',
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.send),
                  onPressed: () async {
                    await sendMessage();
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
