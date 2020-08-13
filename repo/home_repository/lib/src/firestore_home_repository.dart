import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:home_repository/home_repository.dart';
import 'package:home_repository/src/entities/home_entity.dart';
import 'package:home_repository/src/entities/item_entity.dart';

class FirestoreHomeRepository implements HomeRepository {
  final homeCollection = Firestore.instance.collection('homes');

  @override
  Future<void> addItem() {
    throw UnimplementedError();
  }

  @override
  Future<Home> getHome(String uid) async {
    QuerySnapshot homeSnapshot =
        await homeCollection.where('ownerId', isEqualTo: uid).getDocuments();
    if (homeSnapshot.documents.isEmpty) {
      throw 'No home found';
    }
    HomeEntity homeEntity =
        HomeEntity.fromSnapshot(homeSnapshot.documents.single);

    QuerySnapshot itemsSnapshot = await homeCollection
        .document(homeEntity.id)
        .collection('items')
        .getDocuments();

    List<ItemEntity> itemEntities = itemsSnapshot.documents
        .map((DocumentSnapshot snapshot) => ItemEntity.fromSnapshot(snapshot))
        .toList();
    return Home.fromEntity(homeEntity, itemEntities: itemEntities ?? []);
  }

  @override
  Future<void> updateItem() {
    // TODO: implement updateItem
    throw UnimplementedError();
  }

  @override
  Future<void> createHome(String uid) {
    // TODO: implement createHome
    throw UnimplementedError();
  }

  @override
  Future<void> updateHome(String ui) {
    // TODO: implement updateHome
    throw UnimplementedError();
  }
}
