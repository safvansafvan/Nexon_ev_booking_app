import 'package:bookingapp/controller/providers/group_provider/chat_provider.dart';
import 'package:bookingapp/presentation/community_chat/screens/chat_screen.dart';
import 'package:flutter/material.dart';

class MsgSendingWidget extends StatelessWidget {
  const MsgSendingWidget(
      {super.key, required this.widget, required this.value});

  final ChatScreen widget;
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
                value.sendMsg(
                    message: value.textController.text,
                    groupId: widget.data.id);
              }
            },
          ),
        ],
      ),
    );
  }
}
