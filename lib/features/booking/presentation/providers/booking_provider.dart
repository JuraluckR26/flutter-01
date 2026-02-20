import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/providers.dart';
import '../../domain/entities/booking_quote.dart';

class QuoteParams {
  final String itemId;
  final DateTime startAt;
  final DateTime endAt;
  const QuoteParams({required this.itemId, required this.startAt, required this.endAt});

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is QuoteParams &&
          runtimeType == other.runtimeType &&
          itemId == other.itemId &&
          startAt == other.startAt &&
          endAt == other.endAt;

  @override
  int get hashCode => itemId.hashCode ^ startAt.hashCode ^ endAt.hashCode;
}

final bookingQuoteProvider =
    FutureProvider.family.autoDispose<BookingQuote, QuoteParams>((ref, p) async {
  final repo = ref.read(bookingRepositoryProvider);
  return repo.getQuote(itemId: p.itemId, startAt: p.startAt, endAt: p.endAt);
});
