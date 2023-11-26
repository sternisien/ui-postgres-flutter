import 'package:flutter_bloc/flutter_bloc.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc() : super(AppInitial()) {
    on<AppEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}

class AppInitial extends AppState {}

class AppInitEvent extends AppEvent {}

abstract class AppState {}

abstract class AppEvent {}
