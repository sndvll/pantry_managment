import 'package:flutter_bloc/flutter_bloc.dart';

import '../tabs.dart';

class AppTabBloc extends Bloc<AppTabEvent, AppTab> {
  @override
  AppTab get initialState => AppTab.HOME;

  @override
  Stream<AppTab> mapEventToState(AppTabEvent event) async* {
    if (event is AppTabNavigationEvent) {
      yield event.tab;
    }
  }
}
