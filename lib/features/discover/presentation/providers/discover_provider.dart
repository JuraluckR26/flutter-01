import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/providers.dart';
import '../../../item/domain/entities/item.dart';

final searchQueryProvider = StateProvider<String>((ref) => '');

final discoverItemsProvider = FutureProvider.autoDispose<List<Item>>((ref) async {
  final repo = ref.read(discoverRepositoryProvider);
  final q = ref.watch(searchQueryProvider);
  return repo.fetchItems(q: q);
});
