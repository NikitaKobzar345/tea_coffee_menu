import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:menu/auth_bloc/auth_bloc_event.dart';
import 'package:menu/auth_bloc/auth_bloc_state.dart';
import 'package:menu/firebase/firebase_authentication_repository.dart';

class AuthenticationBloc extends Bloc<UserEvent, String> {
  AuthenticationBloc() : super('') {
    on<UserRegistraitionEvent>(_handleUserRegistraition);
    on<UserSignInEvent>(_handleUserSignIn);
  }

  final _authentication = FirebaseAuthentication();

  void _handleUserRegistraition(UserRegistraitionEvent event, Emitter emit) {
    final _callRegistrationMethod =
        _authentication.registerUser(event.email, event.password);

    emit(UserRegistraitionState(registraitionMethod: _callRegistrationMethod));
  }

  void _handleUserSignIn(UserSignInEvent event, Emitter emit) {
    final _callSignInMethod =
        _authentication.signInUser(event.email, event.password);

    emit(UserSignInState(loginMethod: _callSignInMethod));
  }
}
