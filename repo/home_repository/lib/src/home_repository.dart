import 'models/home.dart';

abstract class HomeRepository {
  Future<Home> getHome(String uid);
  Future<void> createHome(String uid);
  Future<void> updateHome(String id);
  Future<void> addItem();
  Future<void> updateItem();
}
