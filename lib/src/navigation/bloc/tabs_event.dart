import 'package:equatable/equatable.dart';

import '../tabs.dart';

abstract class AppTabEvent extends Equatable {
  const AppTabEvent();
}

class AppTabNavigationEvent extends AppTabEvent {
  final AppTab tab;

  const AppTabNavigationEvent(this.tab);

  @override
  List<Object> get props => [tab];

  @override
  String toString() {
    return 'AppTabNavigationEvent { tab: $tab }';
  }
}
