import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../features/discover/data/repositories/fake_discover_repository.dart';
import '../features/discover/domain/repositories/discover_repository.dart';
import '../features/item/data/repositories/fake_item_repository.dart';
import '../features/item/domain/repositories/item_repository.dart';
import '../features/booking/data/repositories/fake_booking_repository.dart';
import '../features/booking/domain/repositories/booking_repository.dart';

final discoverRepositoryProvider = Provider<DiscoverRepository>((ref) {
  return FakeDiscoverRepository();
});

final itemRepositoryProvider = Provider<ItemRepository>((ref) {
  return FakeItemRepository();
});

final bookingRepositoryProvider = Provider<BookingRepository>((ref) {
  return FakeBookingRepository();
});
