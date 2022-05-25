abstract class ChatBotEvent {}

class SendMessageEvent extends ChatBotEvent {
  final String message;

  SendMessageEvent({required this.message});
}
