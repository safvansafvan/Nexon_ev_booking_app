import 'package:nexonev/controller/providers/group_provider/chat_provider.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MsgSendingWidget extends StatelessWidget {
  MsgSendingWidget({super.key, required this.id, required this.value});

  String id;
  final ChatProvider value;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      color: Colors.grey[200],
      child: Row(
        children: [
          IconButton(
            onPressed: () {
              value.showEmoji();
            },
            icon: const Icon(Icons.emoji_emotions),
          ),
          Expanded(
            child: TextFormField(
              onTap: () {
                FocusScope.of(context).unfocus();
                if (value.emojiShowing) value.showEmoji();
              },
              controller: value.textController,
              decoration: const InputDecoration.collapsed(
                hintText: 'Type your message...',
              ),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.send),
            onPressed: () async {
              if (value.textController.text.isNotEmpty) {
                value.sendMsg(message: value.textController.text, groupId: id);
              }
            },
          ),
        ],
      ),
    );
  }
}
