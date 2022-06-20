import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:menu/create_beverage_bloc/create_beverage_event.dart';
import 'package:menu/create_beverage_bloc/create_beverage_state.dart';

class CreateBeverageBloc extends Bloc<BevarageEvent, BeverageState> {
  CreateBeverageBloc(BeverageState initialState) : super(initialState);

  void _handleCreateBeverage(CreateBeverageEvent event, Emitter emit) {
    List<String> _beveragesList = [];
  }
}
