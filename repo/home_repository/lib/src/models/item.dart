import 'package:home_repository/src/entities/item_entity.dart';
import 'package:meta/meta.dart';

@immutable
class Item {
  final String id;
  final ItemType type;
  final String name;
  final double quantity;
  final String unit;
  final bool isOpen;
  final ItemPosition position;
  final DateTime added;
  final DateTime expiring;
  final String brand;

  const Item(
      {this.id,
      this.type,
      this.name,
      this.quantity,
      this.unit,
      this.isOpen,
      this.position,
      this.added,
      this.brand,
      this.expiring});

  Item copyWith(
      {ItemType type,
      String name,
      double quantity,
      String unit,
      bool isOpen,
      ItemPosition position,
      DateTime added,
      DateTime expiring,
      String brand}) {
    return Item(
        id: this.id,
        name: name ?? this.name,
        type: type ?? this.type,
        quantity: quantity ?? this.quantity,
        unit: unit ?? this.unit,
        isOpen: isOpen ?? this.isOpen,
        position: position ?? this.position,
        added: added ?? this.added,
        expiring: expiring ?? this.expiring,
        brand: brand ?? this.brand);
  }

  int get daysSinceAdded => added.difference(DateTime.now()).inDays * -1;
  int get daysUntilExpiring => expiring.difference(DateTime.now()).inDays + 1;

  @override
  String toString() {
    return '{id: $id}';
  }

  @override
  int get hashCode =>
      id.hashCode ^
      name.hashCode ^
      type.hashCode ^
      quantity.hashCode ^
      unit.hashCode ^
      isOpen.hashCode ^
      position.hashCode ^
      added.hashCode ^
      expiring.hashCode ^
      brand.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Item &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          name == other.name &&
          type == other.type &&
          quantity == other.quantity &&
          unit == other.unit &&
          isOpen == other.isOpen &&
          position == other.position &&
          added == other.added &&
          expiring == other.expiring &&
          brand == other.brand;

  ItemEntity toEntity() {
    return ItemEntity(
        id: id,
        name: name,
        type: ItemType.values.indexOf(type),
        quantity: quantity,
        unit: unit,
        isOpen: isOpen,
        position: ItemPosition.values.indexOf(position),
        added: added.toIso8601String(),
        expiring: expiring.toIso8601String(),
        brand: brand);
  }

  static Item fromEntity(ItemEntity entity) {
    return Item(
      id: entity.id,
      name: entity.name,
      position: ItemPosition.values[entity.position],
      type: ItemType.values[entity.type],
      quantity: entity.quantity ?? 0,
      unit: entity.unit ?? '',
      isOpen: entity.isOpen ?? false,
      added:
          DateTime.tryParse(entity.added ?? DateTime.now().toIso8601String()),
      expiring: DateTime.tryParse(
          entity.expiring ?? DateTime.now().toIso8601String()),
    );
  }
}

enum ItemType {
  VEGETABLE,
  DAIRY,
  CHEESE,
  EGGS,
  MEAT,
  FISH,
  CANNED,
  PASTA,
  RICE,
  BREAD,
  HERBS_AND_SPICES,
  FRUIT,
  WATER,
  SOFT_DRINK,
  BEER,
  WINE,
  OTHER
}

enum ItemPosition { FRIDGE, FREEZER, PANTRY, OTHER }

Map<ItemPosition, String> itemPositionLabels(context) => {
      // TODO add labels SAME AS HOME TAB
      ItemPosition.FRIDGE: 'Fridge',
      ItemPosition.FREEZER: 'Freezer',
      ItemPosition.PANTRY: 'Pantry',
      ItemPosition.OTHER: 'Other',
    };

Map<ItemType, String> itemTypeLabels(context) => {
      ItemType.VEGETABLE: 'Vegetables',
      ItemType.DAIRY: 'Dairy',
      ItemType.CHEESE: 'Cheese',
      ItemType.EGGS: 'Eggs',
      ItemType.MEAT: 'Meat',
      ItemType.FISH: 'Fish',
      ItemType.CANNED: 'Canned',
      ItemType.PASTA: 'Pasta',
      ItemType.RICE: 'Rice',
      ItemType.BREAD: 'Bread',
      ItemType.HERBS_AND_SPICES: 'Spices',
      ItemType.FRUIT: 'Fruit',
      ItemType.BEER: 'Beer',
      ItemType.WATER: 'Water',
      ItemType.SOFT_DRINK: 'Soft drinks',
      ItemType.WINE: 'Wine',
      ItemType.OTHER: 'Other'
    };
