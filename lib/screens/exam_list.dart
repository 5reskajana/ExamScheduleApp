import 'package:flutter/material.dart';
import '../models/exam.dart';
import '../widgets/exam_card.dart';

class ExamListScreen extends StatelessWidget {
  final String studentIndex = "226002";

  ExamListScreen({super.key});

  final List<Exam> exams = [
    Exam(subjectName: "Мобилни информациски системи", dateTime: DateTime(2025, 12, 22, 10, 0), rooms: ["138", "315"]),
    Exam(subjectName: "Дизајн на образовен софтвер", dateTime: DateTime(2025, 11, 22, 12, 0), rooms: ["Б1"]),
    Exam(subjectName: "Програмски парадигми", dateTime: DateTime(2025, 11, 24, 15, 0), rooms: ["302"]),
    Exam(subjectName: "Вовед во биоинформатиката", dateTime: DateTime(2025, 10, 25, 13, 0), rooms: ["223"]),
    Exam(subjectName: "Програмирање на видео игри", dateTime: DateTime(2025, 8, 26, 10, 30), rooms: ["Лаб 12", "Лаб 13"]),
    Exam(subjectName: "Линеарна алгебра и примени", dateTime: DateTime(2025, 8, 15, 17, 0), rooms: ["Б 2.2"]),
    Exam(subjectName: "Машинско учење", dateTime: DateTime(2026, 6, 18, 11, 0), rooms: ["200аб", "200в", "215"]),
    Exam(subjectName: "Паралелно и дистрибуирано процесирање", dateTime: DateTime(2025, 9, 14, 14, 0), rooms: ["АМФ МФ"]),
    Exam(subjectName: "Формални јазици и автомати", dateTime: DateTime(2026, 6, 24, 12, 0), rooms: ["Б1"]),
    Exam(subjectName: "Тимски проект", dateTime: DateTime(2026, 1, 31, 10, 30), rooms: ["АМФ ФИНКИ"]),
    Exam(subjectName: "Дизајн на интеракција човек-компјутер", dateTime: DateTime(2026, 6, 31, 10, 30), rooms: ["Лаб 13"]),
  ];

  @override
  Widget build(BuildContext context) {
    exams.sort((a, b) => a.dateTime.compareTo(b.dateTime));

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Распоред за испити - $studentIndex',
          style: const TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blueAccent,
        iconTheme: const IconThemeData(color: Colors.white),
      ),

      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: exams.length,
              itemBuilder: (context, index) => ExamCard(exam: exams[index]),
            ),
          ),
          Container(
            color: Colors.blue[50],
            padding: const EdgeInsets.all(12),
            child: Center(
              child: Text(
                'Вкупно испити: ${exams.length}',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
