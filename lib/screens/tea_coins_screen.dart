import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:menu/tea_coins_cubit/tea_coins_cubit.dart';
import 'package:menu/tea_coins_cubit/tea_coins_state.dart';

class CoinsScreen extends StatefulWidget {
  const CoinsScreen({Key? key}) : super(key: key);

  @override
  State<CoinsScreen> createState() => _CoinsScreenState();
}

class _CoinsScreenState extends State<CoinsScreen> {
  late TeaCoinsCubit teaCoinsCubit;

  @override
  void initState() {
    teaCoinsCubit = TeaCoinsCubit();
    teaCoinsCubit.getTeaCoins();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        onPressed: () {
          Navigator.pop(context);
        },
        child: const Icon(Icons.arrow_back),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
      body: BlocBuilder<TeaCoinsCubit, CoinsState>(
        bloc: teaCoinsCubit,
        builder: (context, state) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Text(
                  'Всего TEA - коинов :\n \n ${state.value} ',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 20.0,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 100.0),
              ),
              ElevatedButton(
                onPressed: () {},
                child: const Text('Потратить !'),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.black),
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
