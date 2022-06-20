import '../widget/message_bubble.dart';

abstract class ChatBotState {
  final List<MessageData> messagesFromMe;
  final List<MessageData> messagesFromBot;

  ChatBotState({required this.messagesFromMe, required this.messagesFromBot});
}

class ChatBotLoaded extends ChatBotState {
  ChatBotLoaded(
      {required List<MessageData> messages,
      required List<MessageData> botMessages})
      : super(messagesFromMe: messages, messagesFromBot: botMessages);
}
