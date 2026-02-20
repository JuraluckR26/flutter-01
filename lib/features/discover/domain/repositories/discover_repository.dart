import '../../../item/domain/entities/item.dart';

abstract class DiscoverRepository {
  Future<List<Item>> fetchItems({String? q});
}
