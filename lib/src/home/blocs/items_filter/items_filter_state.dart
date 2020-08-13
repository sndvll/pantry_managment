import 'package:equatable/equatable.dart';
import 'package:home_repository/home_repository.dart';

abstract class ItemsFilterState extends Equatable {
  const ItemsFilterState();
  @override
  List<Object> get props => [];
}

class ItemsFilterLoading extends ItemsFilterState {}

class ItemsFilterLoaded extends ItemsFilterState {
  final List<Item> filteredItems;

  const ItemsFilterLoaded(this.filteredItems);

  @override
  List<Object> get props => [filteredItems];

  @override
  String toString() {
    return 'ItemsFilterLoaded { filteredItems: $filteredItems }';
  }
}
