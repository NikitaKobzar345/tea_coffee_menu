abstract class BevarageEvent {}

class CreateBeverageEvent extends BevarageEvent {
  final String title;
  final String ingredients;
  final String beverageType;

  CreateBeverageEvent(
      {required this.title,
      required this.ingredients,
      required this.beverageType});
}
