import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:menu/chat_bot_bloc/chat_bot_bloc.dart';
import 'package:menu/chat_bot_bloc/chat_bot_event.dart';
import 'package:menu/chat_bot_bloc/chat_bot_state.dart';
import 'package:menu/widget/message_bubble.dart';

class ChatBotScreen extends StatefulWidget {
  const ChatBotScreen({Key? key}) : super(key: key);

  @override
  State<ChatBotScreen> createState() => _ChatBotScreenState();
}

class _ChatBotScreenState extends State<ChatBotScreen> {
  final TextEditingController _chatTextController = TextEditingController();

  late ChatBotBloc _chatBotBloc;

  @override
  void initState() {
    _chatBotBloc = ChatBotBloc();
    super.initState();
  }

  @override
  void dispose() {
    _chatBotBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Чат - бот'),
        backgroundColor: Colors.black,
      ),
      body: BlocBuilder<ChatBotBloc, ChatBotState>(
        bloc: _chatBotBloc,
        builder: (context, state) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: ListView(
                  children: state.messages
                      .map((messageBubble) => MessageBubble(messageBubble))
                      .toList(),
                ),
              ),
              TextField(
                controller: _chatTextController,
                onChanged: (text) {
                  setState(() {
                    _chatTextController.text;
                  });
                },
                decoration: InputDecoration(
                  prefixIcon: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.list,
                      color: Colors.black,
                    ),
                  ),
                  suffixIcon: _chatTextController.text.isNotEmpty
                      ? IconButton(
                          icon: const Icon(
                            Icons.send,
                            color: Colors.black,
                          ),
                          onPressed: () {
                            _chatBotBloc.add(
                              SendMessageEvent(
                                  message: _chatTextController.text),
                            );
                            _chatTextController.clear();
                          },
                        )
                      : const SizedBox.shrink(),
                  hintText: 'Сообщение...',
                  border: const OutlineInputBorder(),
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
/*IconButton(
                    icon: const Icon(
                      Icons.send,
                      color: Colors.black,
                    ),
                    onPressed: () {
                      _chatBotBloc.add(
                        SendMessageEvent(message: _chatTextController.text),
                      );
                      _chatTextController.clear();
                    },
                  ), */