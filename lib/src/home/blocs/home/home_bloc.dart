import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gold_door/src/home/blocs/home/home.dart';
import 'package:home_repository/home_repository.dart';
import 'package:meta/meta.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HomeRepository _homeRepository;
  StreamSubscription _homeSubscription;

  HomeBloc({@required HomeRepository homeRepository})
      : assert(homeRepository != null),
        _homeRepository = homeRepository;

  @override
  HomeState get initialState => HomeLoading();

  @override
  Stream<HomeState> mapEventToState(HomeEvent event) async* {
    if (event is LoadHome) {
      yield* _mapLoadHomeToState();
    } else if (event is HomeUpdated) {
      yield* _mapHomeUpdateToState(event);
    }
  }

  Stream<HomeState> _mapLoadHomeToState() async* {
    _homeSubscription?.cancel();
    _homeSubscription = _homeRepository
        .getHome('123')
        .asStream()
        .listen((home) => add(HomeUpdated(home)));
  }

  Stream<HomeState> _mapHomeUpdateToState(HomeUpdated event) async* {
    yield HomeLoaded(event.home);
  }
}
