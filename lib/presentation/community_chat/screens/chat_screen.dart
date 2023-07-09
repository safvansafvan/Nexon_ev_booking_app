import 'dart:developer';
import 'package:bookingapp/controller/providers/group_provider/get_all_group_provider.dart';
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
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(groupName),
                  Text(
                    '${groupMembers.length} members',
                    style: const TextStyle(fontSize: 12),
                  ),
                  SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(children: [
                        for (var member in groupMembers)
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 4.0),
                            child: FittedBox(
                              fit: BoxFit.scaleDown,
                              child: Text(
                                member,
                                style: const TextStyle(fontSize: 12),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          )
                      ]))
                ],
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
                        return ListTile(
                          title: Text(message['text']),
                          subtitle: Text(message['name']['name']),
                        );
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
