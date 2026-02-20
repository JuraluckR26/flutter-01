import '../../domain/repositories/booking_repository.dart';
import '../../domain/entities/booking_quote.dart';
import '../../../item/data/repositories/fake_item_repository.dart';

class FakeBookingRepository implements BookingRepository {
  final _itemRepo = FakeItemRepository();

  @override
  Future<BookingQuote> getQuote({
    required String itemId,
    required DateTime startAt,
    required DateTime endAt,
  }) async {
    await Future<void>.delayed(const Duration(milliseconds: 250));
    final item = await _itemRepo.getItem(itemId);

    final days = (endAt.difference(startAt).inDays).clamp(1, 365);
    final rentSubtotal = item.pricePerDay * days;

    // Example: 5% service fee
    final serviceFee = (rentSubtotal * 0.05).round();

    // deposit held
    final deposit = item.deposit;

    final discount = 0;
    final totalPayNow = rentSubtotal + serviceFee + deposit - discount;

    return BookingQuote(
      itemId: itemId,
      startAt: startAt,
      endAt: endAt,
      days: days,
      rentSubtotal: rentSubtotal,
      serviceFee: serviceFee,
      deposit: deposit,
      discount: discount,
      totalPayNow: totalPayNow,
    );
  }
}
