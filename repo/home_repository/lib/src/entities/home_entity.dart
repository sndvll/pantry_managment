import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class HomeEntity extends Equatable {
  final String id;
  final String name;
  final String ownerId;
  final List<String> users;

  const HomeEntity({this.id, this.name, this.ownerId, this.users = const []});

  Map<String, Object> toJson() {
    return {
      'id': id,
      'name': name,
      'ownerId': ownerId,
      'users': users,
    };
  }

  @override
  List<Object> get props => [id, name, ownerId, users];

  @override
  String toString() {
    return 'HomeEntity { id: $id, name: $name, ownerId: $ownerId, users: $users }';
  }

  static HomeEntity fromJson(Map<String, Object> json) {
    return HomeEntity(
        id: json['id'] as String,
        name: json['name'] as String,
        ownerId: json['ownerId'] as String,
        users: json['users'] as List<String>);
  }

  static HomeEntity fromSnapshot(DocumentSnapshot snap) {
    return HomeEntity(
      id: snap.data['id'],
      name: snap.data['name'],
      ownerId: snap.data['ownerId'],
      users: snap.data['users'],
    );
  }

  Map<String, Object> toDocument() {
    return {'name': name, 'ownerId': ownerId, 'users': users};
  }
}
