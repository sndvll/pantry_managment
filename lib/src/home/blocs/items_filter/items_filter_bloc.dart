import 'dart:async';

import 'package:gold_door/src/home/blocs/items_filter/items_filter_state.dart';
import 'package:meta/meta.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gold_door/src/home/blocs/blocs.dart';

class ItemsFilterBloc extends Bloc<ItemsFilterEvent, ItemsFilterState> {
  final HomeBloc _homeBloc;
  StreamSubscription _homeSubscription;

  ItemsFilterBloc({@required HomeBloc homeBloc})
      : assert(homeBloc != null),
        _homeBloc = homeBloc {
    _homeSubscription = homeBloc.listen((state) {
      if (state is HomeLoaded) {
        add(UpdateItems((homeBloc.state as HomeLoaded).home.items));
      }
    });
  }

  @override
  ItemsFilterState get initialState {
    final currentState = _homeBloc.state;
    return currentState is HomeLoaded
        ? ItemsFilterLoaded(currentState.home.items)
        : ItemsFilterLoading();
  }

  @override
  Stream<ItemsFilterState> mapEventToState(ItemsFilterEvent event) async* {
    if (event is UpdateItems) {
      yield* _mapUpdateItemsToState(event);
    } else if (event is OnSearch) {
      yield* _mapOnSearchToState(event);
    }
  }

  Stream<ItemsFilterState> _mapUpdateItemsToState(UpdateItems event) async* {
    final currentState = _homeBloc.state;
    if (currentState is HomeLoaded) {
      yield ItemsFilterLoaded(currentState.home.items);
    }
  }

  Stream<ItemsFilterState> _mapOnSearchToState(OnSearch event) async* {
    final currentState = _homeBloc.state;
    if (currentState is HomeLoaded) {
      if (event.searchString.length > 0) {
        yield ItemsFilterLoaded(currentState.home.items);
      }
      yield ItemsFilterLoaded(currentState.home.items
          .where((element) => element.name
              .toLowerCase()
              .contains(event.searchString.toLowerCase()))
          .toList());
    }
  }

  @override
  Future<void> close() {
    _homeSubscription.cancel();
    return super.close();
  }
}
