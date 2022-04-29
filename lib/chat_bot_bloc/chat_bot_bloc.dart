import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:menu/chat_bot_bloc/chat_bot_event.dart';
import 'package:menu/chat_bot_bloc/chat_bot_state.dart';
import 'package:menu/widget/message_bubble.dart';

class ChatBotBloc extends Bloc<ChatBotEvent, ChatBotState> {
  ChatBotBloc() : super(ChatBotLoaded(messages: [])) {
    on<SendMessageEvent>(_handleSendMessage);
  }

  void _handleSendMessage(SendMessageEvent event, Emitter emit) {
    state.messages.add(MessageData(event.message));
    emit(ChatBotLoaded(messages: state.messages));

    if (event.message.isEmpty) {
      emit(ChatBotLoaded(messages: []));
    }
    if (event.message.startsWith('Hello')) {
      emit(MessageFromBot(messages: state.messages, botMessage: 'Привет'));
    }
  }
}
