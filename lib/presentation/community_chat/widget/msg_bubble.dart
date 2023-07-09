import 'package:bookingapp/controller/const/const.dart';
import 'package:flutter/material.dart';

class MessageBubble extends StatelessWidget {
  final String message;
  final String name;
  final bool isMe;

  // ignore: use_key_in_widget_constructors
  const MessageBubble(
      {required this.message, required this.isMe, required this.name});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
          margin: const EdgeInsets.symmetric(vertical: 4.0),
          decoration: BoxDecoration(
            color: isMe ? Colors.blue : Colors.grey[300],
            borderRadius: BorderRadius.circular(16.0),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: TextStyle(
                    decoration: TextDecoration.underline,
                    color: isMe ? Colors.white : Colors.black),
              ),
              kHeightFive,
              Text(
                message,
                style: TextStyle(color: isMe ? Colors.white : Colors.black),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
