import 'package:equatable/equatable.dart';
import 'package:gold_door/src/home/model/model.dart';

abstract class HomeTabEvent extends Equatable {
  const HomeTabEvent();
}

class HomeTabNavigationEvent extends HomeTabEvent {
  final HomeTab tab;
  const HomeTabNavigationEvent(this.tab);
  @override
  List<Object> get props => [tab];

  @override
  String toString() {
    return 'HomeTabNavigationEvent { tab: $tab }';
  }
}
