import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gold_door/src/home/blocs/tabs/tabs.dart';
import 'package:gold_door/src/home/model/home_tab.dart';

class HomeTabBloc extends Bloc<HomeTabEvent, HomeTab> {
  @override
  HomeTab get initialState => HomeTab.ALL;

  @override
  Stream<HomeTab> mapEventToState(HomeTabEvent event) async* {
    if (event is HomeTabNavigationEvent) {
      yield event.tab;
    }
  }
}
