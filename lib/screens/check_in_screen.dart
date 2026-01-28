import 'package:flutter/material.dart';
import '../models/check_in_entry.dart';
import 'summary_screen.dart';

class CheckInScreen extends StatefulWidget {
  const CheckInScreen({super.key});

  @override
  State<CheckInScreen> createState() => _CheckInScreenState();
}

class _CheckInScreenState extends State<CheckInScreen> {
  double stress = 5;
  bool sleptWell = false;
  String note = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Check In')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Text('How stressed do you feel? (${stress.toInt()})'),

            Slider(
              value: stress,
              min: 0,
              max: 10,
              divisions: 10,
              onChanged: (value) {
                setState(() {
                  stress = value;
                });
              },
            ),

            SwitchListTile(
              title: const Text('Did you sleep well?'),
              value: sleptWell,
              onChanged: (value) {
                setState(() {
                  sleptWell = value;
                });
              },
            ),

            TextField(
              decoration: const InputDecoration(
                labelText: 'Optional note',
              ),
              onChanged: (value) {
                note = value;
              },
            ),

            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: () {
                final entry = CheckInEntry(
                  stress: stress,
                  sleptWell: sleptWell,
                  note: note,
                );

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => SummaryScreen(entry: entry),
                  ),
                );
              },
              child: const Text('Continue'),
            ),
          ],
        ),
      ),
    );
  }
}
