import 'package:equatable/equatable.dart';
import 'package:home_repository/home_repository.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();
  @override
  List<Object> get props => [];
}

class LoadHome extends HomeEvent {}

class HomeUpdated extends HomeEvent {
  final Home home;

  HomeUpdated(this.home);

  @override
  List<Object> get props => [this.home];
}
