import 'package:flutter/material.dart';

class MessageBubble extends StatefulWidget {
  final MessageData message;
  const MessageBubble(this.message, {Key? key}) : super(key: key);

  @override
  State<MessageBubble> createState() => _MessageBubbleState();
}

class _MessageBubbleState extends State<MessageBubble> {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment:
          widget.message.fromMe ? Alignment.centerLeft : Alignment.centerRight,
      child: Container(
        width: 150.0,
        height: 50.0,
        margin: const EdgeInsets.all(18),
        padding: const EdgeInsets.all(8),
        child: Text(
          widget.message.text,
          style: const TextStyle(color: Colors.white, fontSize: 16.0),
        ),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15),
            topRight: Radius.circular(15),
            bottomLeft: Radius.circular(15),
          ),
          color: Colors.black,
        ),
      ),
    );
  }
}

class MessageData {
  final String text;
  final bool fromMe;

  MessageData(this.text, {this.fromMe = false});
}
