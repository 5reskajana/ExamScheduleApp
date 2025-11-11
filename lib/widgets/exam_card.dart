import 'package:flutter/material.dart';
import '../models/exam.dart';
import '../screens/exam_details.dart';
import 'package:intl/intl.dart';

class ExamCard extends StatefulWidget {
  final Exam exam;

  const ExamCard({Key? key, required this.exam}) : super(key: key);

  @override
  State<ExamCard> createState() => _ExamCardState();
}

class _ExamCardState extends State<ExamCard> with SingleTickerProviderStateMixin {
  bool _isPressed = false;

  void _onTapDown(TapDownDetails details) {
    setState(() => _isPressed = true);
  }

  void _onTapUp(TapUpDetails details) {
    setState(() => _isPressed = false);
  }

  void _onTapCancel() {
    setState(() => _isPressed = false);
  }

  @override
  Widget build(BuildContext context) {
    final exam = widget.exam;
    final now = DateTime.now();
    final isPast = exam.dateTime.isBefore(now);
    final formattedDate = DateFormat('dd.MM.yyyy').format(exam.dateTime);
    final formattedTime = DateFormat('HH:mm').format(exam.dateTime);

    // 👇 smarter icon logic
    final difference = exam.dateTime.difference(now).inDays;
    IconData icon;
    if (isPast) {
      icon = Icons.check_circle_outline;
    } else if (difference < 3) {
      icon = Icons.hourglass_bottom; // soon
    } else {
      icon = Icons.hourglass_empty; // not soon
    }

    final iconColor = isPast ? Colors.redAccent : Colors.green[700];

    return AnimatedScale(
      scale: _isPressed ? 0.96 : 1.0,
      duration: const Duration(milliseconds: 100),
      curve: Curves.easeOut,
      child: Card(
        color: isPast ? Colors.red[100] : Colors.green[100],
        elevation: 5,
        margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
        clipBehavior: Clip.antiAlias, // ✅ Ensures ripple stays inside rounded corners
        child: InkWell(
          borderRadius: BorderRadius.circular(14),
          splashColor: Colors.black12.withOpacity(0.1), // softer tap color
          highlightColor: Colors.transparent, // removes sticky blue
          onTapDown: _onTapDown,
          onTapUp: (details) {
            _onTapUp(details);
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ExamDetailScreen(exam: exam),
              ),
            );
          },
          onTapCancel: _onTapCancel,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            child: ListTile(
              leading: Icon(icon, color: iconColor, size: 30),
              title: Text(
                exam.subjectName,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.calendar_today, size: 16),
                      const SizedBox(width: 4),
                      Text('$formattedDate во $formattedTime'),
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(Icons.location_on, size: 16),
                      const SizedBox(width: 4),
                      Text(exam.rooms.join(', ')),
                    ],
                  ),
                ],
              ),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            ),
          ),
        ),
      ),
    );
  }
}
