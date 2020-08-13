import 'package:equatable/equatable.dart';
import 'package:home_repository/home_repository.dart';

abstract class ItemsFilterEvent extends Equatable {
  const ItemsFilterEvent();
}

class UpdateItems extends ItemsFilterEvent {
  final List<Item> items;
  final String searchString;
  const UpdateItems(this.items, {this.searchString = ''});

  @override
  List<Object> get props => [items, searchString];

  @override
  String toString() {
    return 'UpdateItems { items: $items, searchString: $searchString }';
  }
}

class OnSearch extends ItemsFilterEvent {
  final String searchString;

  OnSearch(this.searchString);

  @override
  List<Object> get props => [searchString];

  @override
  String toString() {
    return 'OnSearch { searchString: $searchString }';
  }
}
