import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:menu/chat_bot_bloc/chat_bot_event.dart';
import 'package:menu/chat_bot_bloc/chat_bot_state.dart';
import 'package:menu/widget/message_bubble.dart';

class ChatBotBloc extends Bloc<ChatBotEvent, ChatBotState> {
  ChatBotBloc() : super(ChatBotLoaded(messages: [], botMessages: [])) {
    on<SendMessageEvent>(_handleSendMessage);
  }

  final List<String> _teaIngredients = [
    'Манго',
    'Шалфей',
    'Тимьян',
    'Лимон',
    'Имбирь',
    'Корица',
    'Лёд',
    'Мёд',
    'Ромашка',
    'Мята',
    'Чабрец',
    'Малина'
  ];

  final List<String> _coffeeIngredients = [
    'Эспрессо',
    'Молоко',
    'Сливки',
    'Маскорпоне',
    'Сироп',
    'Прянности',
    'Сахар',
    'Американо'
  ];

  void _handleSendMessage(SendMessageEvent event, Emitter emit) {
    state.messagesFromMe.add(MessageData(event.message));
    emit(ChatBotLoaded(messages: state.messagesFromMe, botMessages: []));

    if (event.message.startsWith('Hello')) {
      for (var _ in state.messagesFromMe) {
        state.messagesFromBot.add(MessageData('Привет'));
      }
      emit(ChatBotLoaded(
          messages: state.messagesFromMe, botMessages: state.messagesFromBot));
    }

    if (event.message.startsWith('Сделай мне чай !')) {
      for (int i = 0; i <= _teaIngredients.length; i++) {
        _teaIngredients.shuffle();
        _teaIngredients.length / 2;
      }
      state.messagesFromBot.add(MessageData(_teaIngredients.toString()));
    } else if (event.message.startsWith('Сделай мне кофе !')) {
      for (int i = 0; i <= _coffeeIngredients.length; i++) {
        _coffeeIngredients.shuffle();
        _coffeeIngredients.length / 2;
      }
      state.messagesFromBot.add(MessageData(_coffeeIngredients.toString()));
    }

    emit(ChatBotLoaded(
        messages: state.messagesFromMe, botMessages: state.messagesFromBot));
  }
}
