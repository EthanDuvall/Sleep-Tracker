import 'package:flutter/material.dart';
import '../models/check_in_entry.dart';

class SummaryScreen extends StatelessWidget {
  final CheckInEntry entry;

  const SummaryScreen({
    super.key,
    required this.entry,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Summary')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Stress level: ${entry.stress.toInt()}'),
            Text('Slept well: ${entry.sleptWell ? "Yes" : "No"}'),
            Text('Note: ${entry.note.isEmpty ? "None" : entry.note}'),

            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Submit another entry'),
            ),
          ],
        ),
      ),
    );
  }
}
