import '../widget/message_bubble.dart';

abstract class ChatBotState {
  final List<MessageData> messages;

  ChatBotState({required this.messages});
}

class ChatBotLoaded extends ChatBotState {
  ChatBotLoaded({required List<MessageData> messages})
      : super(messages: messages);
}

class MessageFromBot extends ChatBotState {
  final String botMessage;
  MessageFromBot(
      {required List<MessageData> messages, required this.botMessage})
      : super(messages: messages);
}
