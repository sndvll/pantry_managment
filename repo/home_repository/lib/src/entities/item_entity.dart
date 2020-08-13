import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class ItemEntity extends Equatable {
  final String id;
  final int type;
  final String name;
  final double quantity;
  final String unit;
  final bool isOpen;
  final int position;
  final String added;
  final String expiring;
  final String brand;

  const ItemEntity(
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

  @override
  List<Object> get props => [
        id,
        type,
        name,
        quantity,
        unit,
        isOpen,
        position,
        added,
        expiring,
        brand
      ];

  @override
  String toString() {
    return 'ItemEntity {id: $id, name: $name }';
  }

  static ItemEntity fromJson(Map<String, Object> json) {
    return ItemEntity(
      id: json['id'] as String,
      type: json['type'] as int,
      name: json['name'] as String,
      quantity: json['quantity'] as double,
      isOpen: json['isOpen'] as bool,
      position: json['position'] as int,
      added: json['added'] as String,
      brand: json['brand'] as String,
      expiring: json['expiring'] as String,
    );
  }

  static ItemEntity fromSnapshot(DocumentSnapshot snap) {
    return ItemEntity(
      id: snap.data['id'],
      type: snap.data['type'],
      name: snap.data['name'],
      quantity: snap.data['quantity'],
      isOpen: snap.data['isOpen'],
      position: snap.data['position'],
      added: snap.data['added'],
      brand: snap.data['brand'],
      expiring: snap.data['expiring'],
    );
  }

  Map<String, Object> toDocument() {
    return {
      'id': id,
      'type': type,
      'name': name,
      'quantity': quantity,
      'isOpen': isOpen,
      'position': position,
      'added': added,
      'brand': brand,
      'expiring': expiring,
    };
  }
}
