import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/exam.dart';

class ExamDetailScreen extends StatelessWidget {
  final Exam exam;

  const ExamDetailScreen({super.key, required this.exam});

  String _getTimeRemaining() {
    final now = DateTime.now();
    final diff = exam.dateTime.difference(now);
    if (diff.isNegative) {
      return "Испитот веќе помина.";
    }
    final days = diff.inDays;
    final hours = diff.inHours % 24;
    return "$days дена, $hours часа";
  }

  @override
  Widget build(BuildContext context) {
    final formattedDate = DateFormat('dd.MM.yyyy').format(exam.dateTime);
    final formattedTime = DateFormat('HH:mm').format(exam.dateTime);

    return Scaffold(
      appBar: AppBar(
        title: Text(exam.subjectName),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          elevation: 4,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Предмет: ${exam.subjectName}",
                    style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                const SizedBox(height: 10),
                Row(
                  children: [
                    const Icon(Icons.calendar_today),
                    const SizedBox(width: 8),
                    Text("Датум: $formattedDate, Време: $formattedTime"),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    const Icon(Icons.location_on),
                    const SizedBox(width: 8),
                    Text("Простории: ${exam.rooms.join(', ')}"),
                  ],
                ),
                const SizedBox(height: 20),
                const Divider(),
                Text(
                  "Преостанато време: ${_getTimeRemaining()}",
                  style: const TextStyle(fontSize: 16, color: Colors.blueAccent),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
