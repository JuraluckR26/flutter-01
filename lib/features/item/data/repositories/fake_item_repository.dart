import '../../domain/repositories/item_repository.dart';
import '../../domain/entities/item.dart';
import '../../../discover/data/repositories/fake_discover_repository.dart';

class FakeItemRepository implements ItemRepository {
  final _discover = FakeDiscoverRepository();

  @override
  Future<Item> getItem(String id) async {
    final items = await _discover.fetchItems();
    return items.firstWhere((e) => e.id == id);
  }
}
