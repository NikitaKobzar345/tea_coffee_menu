import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:menu/auth_bloc/auth_bloc.dart';
import 'package:menu/auth_bloc/auth_bloc_event.dart';
import 'package:menu/screens/login_screen.dart';
import 'package:menu/screens/menu_screen.dart';

class RegistraitionScreen extends StatefulWidget {
  const RegistraitionScreen({Key? key}) : super(key: key);

  @override
  State<RegistraitionScreen> createState() => _RegistraitionScreenState();
}

class _RegistraitionScreenState extends State<RegistraitionScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  late AuthenticationBloc registraitionBloc;

  @override
  void initState() {
    registraitionBloc = AuthenticationBloc();
    super.initState();
  }

  @override
  void dispose() {
    registraitionBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Добро пожаловать '),
        backgroundColor: Colors.black,
      ),
      body: BlocBuilder(
        bloc: registraitionBloc,
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
                  registraitionBloc.add(
                    UserRegistraitionEvent(
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
                child: const Text('Зарегистрироваться'),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.black),
                  splashFactory: NoSplash.splashFactory,
                  shadowColor: MaterialStateProperty.all(Colors.transparent),
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return const LoginScreen();
                      },
                    ),
                  );
                },
                child: const Text(
                  'Уже есть аккаунт ? Тогда войдите !',
                  style: TextStyle(fontSize: 16.0),
                ),
                style: ButtonStyle(
                  splashFactory: NoSplash.splashFactory,
                  shadowColor: MaterialStateProperty.all(Colors.transparent),
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
