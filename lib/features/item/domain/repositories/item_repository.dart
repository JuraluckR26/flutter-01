import '../entities/item.dart';

abstract class ItemRepository {
  Future<Item> getItem(String id);
}
