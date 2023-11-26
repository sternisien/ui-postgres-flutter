import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uitraining/bloc/home/home_event.dart';
import 'package:uitraining/bloc/home/home_state.dart';

class HomeBloc extends Bloc<AbstractHomeEvent, AbstractHomeState> {
  HomeBloc() : super(HomeInitialState()) {
    on<HomeEvent>(
      (event, emit) {
        emit(HomeToDetailsState());
      },
    );

    on<HomeNavigationEvent>(
      (event, emit) {
        emit(HomeToDetailsState());
      },
    );
  }
}
