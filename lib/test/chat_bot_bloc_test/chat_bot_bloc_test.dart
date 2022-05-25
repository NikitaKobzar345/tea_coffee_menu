import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:menu/chat_bot_bloc/chat_bot_bloc.dart';
import 'package:menu/chat_bot_bloc/chat_bot_event.dart';
import 'package:menu/chat_bot_bloc/chat_bot_state.dart';

class MockSendMessage extends MockBloc<ChatBotEvent, ChatBotState>
    implements ChatBotBloc {}

void main() {
  group('ChatBotBloc', () {
    late ChatBotBloc chatBotBloc;

    setUp(() {
      chatBotBloc = MockSendMessage();
    });

    tearDown(() {
      chatBotBloc.close();
    });

    blocTest(
      'Проверить состояние блока при условии, что сообщение не отправленно',
      build: () => chatBotBloc,
      act: (_) => chatBotBloc.add(SendMessageEvent(message: '')),
      expect: () => [],
    );

    blocTest(
      'Проверить состояние блока при отправки сообщения [Hello] ',
      build: () => chatBotBloc,
      act: (_) => chatBotBloc.add(SendMessageEvent(message: 'Hello')),
      expect: () => isA<List>(),
    );

    blocTest(
      'Проверить состояние блока при отправки команды [Сделай мне чай !]',
      build: () => chatBotBloc,
      act: (_) =>
          chatBotBloc.add(SendMessageEvent(message: 'Сделай мне чай !')),
      expect: () => isA<List>(),
    );

    blocTest(
      'Проверить состояние блока при отправки команды `Сделай мне кофе !`',
      build: () => chatBotBloc,
      act: (_) =>
          chatBotBloc.add(SendMessageEvent(message: 'Сделай мне кофе !')),
      expect: () => isA<List>(),
    );
  });
}
