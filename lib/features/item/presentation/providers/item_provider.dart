import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/providers.dart';
import '../../domain/entities/item.dart';

final itemDetailProvider = FutureProvider.family.autoDispose<Item, String>((ref, id) async {
  final repo = ref.read(itemRepositoryProvider);
  return repo.getItem(id);
});
