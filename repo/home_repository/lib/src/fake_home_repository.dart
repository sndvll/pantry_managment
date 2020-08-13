import 'dart:async';

import 'package:home_repository/src/models/home.dart';

import '../home_repository.dart';
import 'home_repository.dart';

class FakeHomeRepository implements HomeRepository {
  @override
  Future<Home> getHome(String uid) {
    return Future.value(Home(
        id: '123', ownerId: '234', name: 'My Nice Home', items: [...mockData]));
  }

  @override
  Future<void> addItem() {
    // TODO: implement addItem
    throw UnimplementedError();
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

List<Item> mockData = [
  Item(
      type: ItemType.VEGETABLE,
      name: 'Morötter',
      added: DateTime.now(),
      quantity: 300,
      unit: 'g',
      isOpen: true,
      expiring: DateTime(2020, 6, 17),
      position: ItemPosition.FRIDGE),
  Item(
      type: ItemType.EGGS,
      name: 'Ägg',
      added: DateTime.now().subtract(Duration(days: 2)),
      quantity: 6,
      unit: 'st',
      isOpen: false,
      expiring: DateTime(2020, 6, 18),
      position: ItemPosition.FRIDGE),
  Item(
      type: ItemType.MEAT,
      name: 'Korv',
      added: DateTime.now(),
      quantity: 300,
      unit: 'g',
      isOpen: false,
      brand: 'Anamma',
      expiring: DateTime(2020, 7, 19),
      position: ItemPosition.FREEZER),
  Item(
      type: ItemType.CANNED,
      name: 'Krossade tomater',
      added: DateTime.now(),
      quantity: 1,
      unit: 'burk',
      isOpen: false,
      brand: 'Oatly',
      position: ItemPosition.PANTRY),
  Item(
      type: ItemType.DAIRY,
      name: 'iKaffe',
      added: DateTime.now(),
      quantity: 1,
      unit: 'l',
      isOpen: true,
      position: ItemPosition.FRIDGE),
  Item(
      type: ItemType.PASTA,
      name: 'Spaghetti',
      added: DateTime.now(),
      quantity: 1,
      unit: 'kg',
      isOpen: true,
      brand: 'Barilla',
      position: ItemPosition.PANTRY),
  Item(
      type: ItemType.CHEESE,
      name: 'Texmex Ost',
      added: DateTime.now(),
      quantity: 200,
      unit: 'g',
      isOpen: false,
      brand: 'Arla',
      position: ItemPosition.FREEZER),
  Item(
      type: ItemType.HERBS_AND_SPICES,
      name: 'Svartpeppar',
      added: DateTime.now(),
      quantity: 40,
      unit: 'g',
      isOpen: true,
      brand: 'Santa Maria',
      position: ItemPosition.PANTRY),
  Item(
      type: ItemType.BREAD,
      name: 'Lingongrova',
      added: DateTime.now(),
      quantity: 300,
      unit: 'g',
      isOpen: true,
      brand: 'Pågen',
      position: ItemPosition.FREEZER),
  Item(
      type: ItemType.FRUIT,
      name: 'Bananer',
      added: DateTime.now(),
      quantity: 2,
      unit: 'st',
      isOpen: false,
      position: ItemPosition.OTHER),
  Item(
      type: ItemType.FISH,
      name: 'Fesk',
      added: DateTime.now(),
      quantity: 1,
      unit: 'kg',
      isOpen: false,
      position: ItemPosition.FREEZER),
];
