import 'package:equatable/equatable.dart';
import 'package:home_repository/home_repository.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeLoading extends HomeState {}

class HomeLoaded extends HomeState {
  final Home home;

  const HomeLoaded(this.home);

  @override
  List<Object> get props => [this.home];

  @override
  String toString() =>
      'HomeLoaded { id: ${home.id}, name: ${home.name}, items: ${home.items.length.toString()} }';
}

class HomeNotLoaded extends HomeState {}
