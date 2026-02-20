import '../../domain/repositories/discover_repository.dart';
import '../../../item/domain/entities/item.dart';

class FakeDiscoverRepository implements DiscoverRepository {
  @override
  Future<List<Item>> fetchItems({String? q}) async {
    await Future<void>.delayed(const Duration(milliseconds: 250));
    final all = <Item>[
      const Item(
        id: '1',
        title: 'Sony A7 III Camera',
        pricePerDay: 800,
        deposit: 2000,
        currency: 'THB',
        category: 'Electronics',
        rating: 4.9,
      ),
      const Item(
        id: '2',
        title: '4K Projector',
        pricePerDay: 500,
        deposit: 1500,
        currency: 'THB',
        category: 'Electronics',
        rating: 4.7,
      ),
      const Item(
        id: '3',
        title: 'Camping Tent (4 people)',
        pricePerDay: 250,
        deposit: 800,
        currency: 'THB',
        category: 'Outdoor',
        rating: 4.8,
      ),
    ];

    if (q == null || q.trim().isEmpty) return all;
    final s = q.toLowerCase();
    return all.where((e) => e.title.toLowerCase().contains(s)).toList();
  }
}
