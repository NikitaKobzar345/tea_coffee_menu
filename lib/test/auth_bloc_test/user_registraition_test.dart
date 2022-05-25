import 'package:bloc_test/bloc_test.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:menu/auth_bloc/auth_bloc.dart';
import 'package:menu/auth_bloc/auth_bloc_event.dart';
import 'package:menu/firebase/firebase_authentication_repository.dart';
import 'package:mockito/mockito.dart';

class MockUserRegistraition extends Mock implements AuthenticationRepository {}

class MockAuthentictionBloc extends MockBloc<UserEvent, String>
    implements AuthenticationBloc {}

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();

  late MockUserRegistraition mockUserRegistraition;
  late AuthenticationBloc authenticationBloc;
  late MockAuthentictionBloc mockAuthentictionBloc;

  group('Authentication Bloc', () {
    setUp(() {
      mockUserRegistraition = MockUserRegistraition();
      authenticationBloc = AuthenticationBloc();
      mockAuthentictionBloc = MockAuthentictionBloc();
    });

    //  final bloc = AuthenticationBloc(mockUserRegistraitionBloc);

    // blocTest('Проверить действительно ли регистрация прошла успешно',
    //     build: () {
    //       when(mockUserRegistraitionBloc.registerUser('email', 'password'))
    //           .thenAnswer((_) async => Future);
    //       return AuthenticationBloc(mockAuthentictionBloc);
    //     },
    //     act: (_) => authenticationBloc
    //         .add(UserRegistraitionEvent(email: "email", password: "password")),
    //     expect: () => UserRegistraitionState(
    //         registraitionMethod:
    //             mockUserRegistraitionBloc.registerUser('email', 'password')));

    test('Проверить действительно ли регистрация прошла успешно', () {
      when(mockUserRegistraition.registerUser('email', 'password')).thenAnswer(
        (_) async => Future<void>,
      );
    });
  });
}
