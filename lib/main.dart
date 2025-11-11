import 'package:flutter/material.dart';
import 'screens/exam_list.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Exam Schedule',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: ExamListScreen(),

    );
  }
}
