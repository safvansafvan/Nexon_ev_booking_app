import 'dart:developer';

import 'package:bookingapp/controller/const/string.dart';
import 'package:bookingapp/controller/providers/group_provider/get_all_group_provider.dart';
import 'package:bookingapp/presentation/community_chat/widget/group_details.dart';
import 'package:bookingapp/presentation/community_chat/widget/msg_bubble.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class ChatScreen extends StatefulWidget {
  const ChatScreen({
    Key? key,
    required this.groupName,
    required this.groupMembers,
    required this.groupId,
  }) : super(key: key);

  final String groupName;
  final List groupMembers;
  final String groupId;

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final msgSendController = TextEditingController();
  late IO.Socket? socket;
  List<Map<String, dynamic>> sendMsg = [];

  @override
  void initState() {
    super.initState();
    // Establish Socket.IO connection
    socket = IO.io(Urls.baseUrl, <String, dynamic>{
      'transports': ['websocket'],
      'autoConnect': false,
    });

    socket?.on('connect', (_) {
      log('Connected');
    });

    socket?.on('disconnect', (_) {
      log('Disconnected');
    });

    socket?.on('messages', (data) {
      log('Received message: $data');
    });
  }

  @override
  void dispose() {
    socket?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
                        groupLength: widget.groupMembers.length,
                        groupName: widget.groupName,
                        groupMembers: widget.groupMembers,
                      ),
                    ),
                  );
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(widget.groupName),
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
            child: Consumer<GetAllGroupsProvider>(
              builder: (context, value, _) {
                return ListView.builder(
                  itemCount: value.messages.length + sendMsg.length,
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
                          sendMsg[index - value.messages.length];
                      return MessageBubble(
                        message: sentMessage['text'],
                        isMe: sentMessage['isMe'],
                        name: sentMessage['name'],
                      );
                    }
                  },
                );
              },
            ),
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
                  child: TextField(
                    controller: msgSendController,
                    decoration: const InputDecoration.collapsed(
                      hintText: 'Type your message...',
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.send),
                  onPressed: () async {
                    final name = await messageSend(groupId: widget.groupId);
                    final sentMessage = {
                      'text': msgSendController.text,
                      'isMe': true,
                      'name': name,
                    };
                    setState(() {
                      sendMsg.add(sentMessage);
                    });
                    socket!.emit('messages', {
                      'name': name,
                      'text': msgSendController.text,
                    });
                    msgSendController.clear();
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  messageSend({sendMsg, groupId}) async {
    final pref = await SharedPreferences.getInstance();
    final name = pref.getString("USER_NAME");
    final messageText = sendMsg;
    socket!.emit(
        'messages', {'name': name, 'text': messageText, "groupId": groupId});
    return name;
  }
}
