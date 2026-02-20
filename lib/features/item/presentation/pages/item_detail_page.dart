import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../providers/item_provider.dart';
import '../../../../shared/utils/money.dart';

class ItemDetailPage extends ConsumerWidget {
  final String itemId;
  const ItemDetailPage({super.key, required this.itemId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final itemAsync = ref.watch(itemDetailProvider(itemId));

    return Scaffold(
      appBar: AppBar(title: const Text('Item detail')),
      body: itemAsync.when(
        data: (it) => Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 220,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.black12,
                  borderRadius: BorderRadius.circular(18),
                ),
                child: const Center(child: Icon(Icons.image, size: 56)),
              ),
              const SizedBox(height: 16),
              Text(it.title, style: Theme.of(context).textTheme.titleLarge),
              const SizedBox(height: 8),
              Text('${Money.thb(it.pricePerDay)}/day • Deposit ${Money.thb(it.deposit)}'),
              const SizedBox(height: 10),
              Text(
                'Escrow rule: Your payment is held. Owner receives payout only after you confirm pickup (ตรวจของก่อนรับ).',
                style: Theme.of(context).textTheme.bodySmall,
              ),
              const Spacer(),
              SizedBox(
                width: double.infinity,
                child: FilledButton(
                  onPressed: () => context.go('/booking/${it.id}'),
                  child: const Text('Select dates'),
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
}
