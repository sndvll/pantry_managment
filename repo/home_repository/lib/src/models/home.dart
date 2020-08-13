import 'package:home_repository/src/entities/home_entity.dart';
import 'package:home_repository/src/entities/item_entity.dart';
import 'package:meta/meta.dart';

import 'item.dart';

@immutable
class Home {
  final String id;
  final String name;
  final List<Item> items;
  final String ownerId;
  final List<String> users;

  const Home({
    @required this.id,
    String name,
    @required String ownerId,
    List users,
    this.items = const [],
  })  : this.name = name ?? 'Not named',
        this.ownerId = ownerId,
        this.users = users ?? const [];

  Home copyWith(
      {String id,
      String name,
      List<Item> items,
      String ownerId,
      List<String> users}) {
    return Home(
        id: id ?? this.id,
        name: name ?? this.name,
        items: items ?? this.items,
        ownerId: ownerId ?? this.items,
        users: users ?? this.users);
  }

  @override
  int get hashCode =>
      id.hashCode ^
      name.hashCode ^
      items.hashCode ^
      ownerId.hashCode ^
      users.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Home &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          name == other.name &&
          items == other.items &&
          ownerId == other.ownerId &&
          users == other.users;

  @override
  String toString() {
    return 'Home {id: $id, name: $name, ownerId: $ownerId}';
  }

  HomeEntity toEntity() {
    return HomeEntity(
      id: id,
      name: name,
      ownerId: ownerId,
      users: users,
    );
  }

  static Home fromEntity(HomeEntity entity, {List<ItemEntity> itemEntities}) {
    List<Item> items = [];
    if (itemEntities != null) {
      items = itemEntities.map((entity) => Item.fromEntity(entity)).toList();
    }
    return Home(
        id: entity.id,
        ownerId: entity.ownerId,
        name: entity.name,
        users: entity.users,
        items: items);
  }
}
