abstract class UserEvent {}

class UserRegistraitionEvent extends UserEvent {
  final String email;
  final String password;

  UserRegistraitionEvent({required this.email, required this.password});
}

class UserSignInEvent extends UserEvent {
  final String email;
  final String password;

  UserSignInEvent({required this.email, required this.password});
}
