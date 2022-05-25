abstract class BeverageState {}

class CreateBeverageState extends BeverageState {
  final String beverageTitle;
  final String beverageIngredients;
  final String beverageType;

  CreateBeverageState(
      {required this.beverageTitle,
      required this.beverageIngredients,
      required this.beverageType});
}
