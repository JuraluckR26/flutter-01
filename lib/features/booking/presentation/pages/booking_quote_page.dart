import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/booking_provider.dart';
import '../../../../shared/utils/money.dart';

class BookingQuotePage extends ConsumerWidget {
  final String itemId;
  final DateTime startAt;
  final DateTime endAt;

  const BookingQuotePage({
    super.key,
    required this.itemId,
    required this.startAt,
    required this.endAt,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final quoteAsync =
        ref.watch(bookingQuoteProvider(QuoteParams(itemId: itemId, startAt: startAt, endAt: endAt)));

    return Scaffold(
      appBar: AppBar(title: const Text('Booking quote')),
      body: quoteAsync.when(
        data: (q) => Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Item: $itemId', style: Theme.of(context).textTheme.titleMedium),
              const SizedBox(height: 8),
              Text('Days: ${q.days} (${startAt.toLocal().toString().split(" ").first} → ${endAt.toLocal().toString().split(" ").first})'),
              const SizedBox(height: 16),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(14),
                  child: Column(
                    children: [
                      _row('Rent subtotal', Money.thb(q.rentSubtotal)),
                      const SizedBox(height: 8),
                      _row('Service fee', Money.thb(q.serviceFee)),
                      const SizedBox(height: 8),
                      _row('Deposit (held)', Money.thb(q.deposit)),
                      if (q.discount > 0) ...[
                        const SizedBox(height: 8),
                        _row('Discount', '-${Money.thb(q.discount)}'),
                      ],
                      const Divider(height: 24),
                      _row('Pay now (escrow)', Money.thb(q.totalPayNow), bold: true),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 12),
              Text(
                'Payment is held in escrow.
Owner receives payout only AFTER you confirm pickup (ตรวจของก่อนรับ).
If item has issues at pickup, open dispute — payout will NOT be released.',
                style: Theme.of(context).textTheme.bodySmall,
              ),
              const Spacer(),
              SizedBox(
                width: double.infinity,
                child: FilledButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Next: Create booking + Payment (not implemented in mock)'),
                      ),
                    );
                  },
                  child: const Text('Confirm & Pay'),
                ),
              ),
            ],
          ),
        ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text('Error: $e')),
      ),
    );
  }

  Widget _row(String label, String value, {bool bold = false}) {
    final style = bold ? const TextStyle(fontWeight: FontWeight.w700) : null;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: style),
        Text(value, style: style),
      ],
    );
  }
}
