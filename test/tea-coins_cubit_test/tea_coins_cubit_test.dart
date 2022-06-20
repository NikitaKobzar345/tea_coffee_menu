import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:menu/tea_coins_cubit/tea_coins_cubit.dart';
import 'package:menu/tea_coins_cubit/tea_coins_state.dart';

class MockTeaCoinsCubit extends MockCubit<CoinsState> implements TeaCoinsCubit {
}

void main() {
  late MockTeaCoinsCubit mockTeaCoinsCubit;

  group('TeaCoinsTestCubit', () {
    setUp((() {
      mockTeaCoinsCubit = MockTeaCoinsCubit();
    }));

    tearDown((() {
      mockTeaCoinsCubit.close();
    }));

    /// Для того кто сейчас смотрит мой гитхаб
    /// Я не знаю что делать с этим тестом
    /// Он выдают какое то не логичное заключение
    /// Помогите
    blocTest(
      'Проверить что метод [getCoins] работает как ожидается ',
      build: () => mockTeaCoinsCubit,
      act: (cubit) => mockTeaCoinsCubit.getTeaCoins(),
      expect: () => [],
    );
  });
}
