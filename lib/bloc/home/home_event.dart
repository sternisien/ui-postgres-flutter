import 'package:uitraining/bloc/app_bloc.dart';

class HomeEvent extends AbstractHomeEvent {
  late String test;
  HomeEvent(this.test);
}

class HomeNavigationEvent extends AbstractHomeEvent {
  late int idxBottomBar;
  HomeNavigationEvent(this.idxBottomBar);
}

abstract class AbstractHomeEvent {}
