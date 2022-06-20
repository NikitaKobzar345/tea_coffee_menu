abstract class CoinsState {
  final int value;

  CoinsState({required this.value});
}

class TeaCoinsState extends CoinsState {
  TeaCoinsState({required int value}) : super(value: value);
}
