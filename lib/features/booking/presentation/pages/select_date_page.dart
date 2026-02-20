import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SelectDatePage extends StatefulWidget {
  final String itemId;
  const SelectDatePage({super.key, required this.itemId});

  @override
  State<SelectDatePage> createState() => _SelectDatePageState();
}

class _SelectDatePageState extends State<SelectDatePage> {
  DateTime? start;
  DateTime? end;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Select dates')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            _tile(
              label: 'Start date',
              value: start,
              onTap: () async {
                final d = await showDatePicker(
                  context: context,
                  firstDate: DateTime.now(),
                  lastDate: DateTime.now().add(const Duration(days: 365)),
                );
                if (d != null) setState(() => start = d);
              },
            ),
            _tile(
              label: 'End date',
              value: end,
              onTap: () async {
                final d = await showDatePicker(
                  context: context,
                  firstDate: start ?? DateTime.now(),
                  lastDate: DateTime.now().add(const Duration(days: 365)),
                );
                if (d != null) setState(() => end = d);
              },
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: FilledButton(
                onPressed: (start != null && end != null)
                    ? () {
                        final uri = Uri(
                          path: '/booking/${widget.itemId}/quote',
                          queryParameters: {
                            'startAt': start!.toIso8601String(),
                            'endAt': end!.toIso8601String(),
                          },
                        );
                        context.go(uri.toString());
                      }
                    : null,
                child: const Text('Get quote'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _tile({
    required String label,
    required DateTime? value,
    required VoidCallback onTap,
  }) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: Text(label),
      subtitle: Text(value?.toLocal().toString().split(' ').first ?? '-'),
      trailing: const Icon(Icons.date_range),
      onTap: onTap,
    );
  }
}
