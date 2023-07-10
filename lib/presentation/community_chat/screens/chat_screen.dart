import 'dart:developer';
import 'package:bookingapp/controller/providers/group_provider/get_all_group_provider.dart';
import 'package:bookingapp/presentation/community_chat/widget/group_details.dart';
import 'package:bookingapp/presentation/community_chat/widget/msg_bubble.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen(
      {super.key, required this.groupName, required this.groupMembers});

  final String groupName;
  final List groupMembers;
  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      log("$groupMembers");
    });
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
                          groupLength: groupMembers.length,
                          groupName: groupName,
                          groupMembers: groupMembers),
                    ),
                  );
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(groupName),
                    const Text(
                      'Click here for group info',
                      style: TextStyle(fontSize: 12),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Consumer<GetAllGroupsProvider>(builder: (context, value, _) {
              return value.msgLoading
                  ? const Center(child: CircularProgressIndicator())
                  : ListView.builder(
                      itemCount: value.messages.length,
                      itemBuilder: (context, index) {
                        final message = value.messages[index];
                        return MessageBubble(
                            message: message['text'],
                            isMe: false,
                            name: message['name']['name']);
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
                    onPressed: () {}, icon: const Icon(Icons.emoji_emotions)),
                const Expanded(
                  child: TextField(
                    decoration: InputDecoration.collapsed(
                      hintText: 'Type your message...',
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.send),
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
