import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:menu/tea_coins_cubit/tea_coins_state.dart';

class TeaCoinsCubit extends Cubit<CoinsState> {
  TeaCoinsCubit() : super(TeaCoinsState(value: 0));

  void getTeaCoins() {
    int _coinsCount = 0;

    /// Числа для добавления к общему числу коинов
    List<int> _additionalValues = [25, 30, 35, 40, 50, 80, 100, 200];

    for (int i = 0; i <= _additionalValues.length; i++) {
      _additionalValues.shuffle();
      _coinsCount += _additionalValues.first;
    }

    emit(TeaCoinsState(value: _coinsCount));
  }
}
