import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:menu/auth_bloc/auth_bloc.dart';
import 'package:menu/auth_bloc/auth_bloc_event.dart';
import 'package:menu/screens/menu_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  late AuthenticationBloc loginBloc;

  @override
  void initState() {
    loginBloc = AuthenticationBloc();
    super.initState();
  }

  @override
  void dispose() {
    loginBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Добро пожаловать'),
        backgroundColor: Colors.black,
      ),
      body: BlocBuilder(
        bloc: loginBloc,
        builder: (context, state) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: _emailController,
                textAlign: TextAlign.center,
                decoration: const InputDecoration(
                  hintText: 'Почта',
                  border: OutlineInputBorder(),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 18.0),
              ),
              TextFormField(
                controller: _passwordController,
                obscureText: true,
                textAlign: TextAlign.center,
                decoration: const InputDecoration(
                  hintText: 'Пароль',
                  border: OutlineInputBorder(),
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(12.0),
              ),
              ElevatedButton(
                onPressed: () {
                  loginBloc.add(
                    UserSignInEvent(
                        email: _emailController.text,
                        password: _passwordController.text),
                  );
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return const MenuScreen();
                      },
                    ),
                  );
                },
                child: const Text('Войти'),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.black),
                  splashFactory: NoSplash.splashFactory,
                  shadowColor: MaterialStateProperty.all(Colors.transparent),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
