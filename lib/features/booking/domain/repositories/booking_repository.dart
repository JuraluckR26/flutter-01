import '../entities/booking_quote.dart';

abstract class BookingRepository {
  Future<BookingQuote> getQuote({
    required String itemId,
    required DateTime startAt,
    required DateTime endAt,
  });
}
