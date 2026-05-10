import 'package:flutter/material.dart';
import 'package:carli_et/features/student/presentation/internship_details_page.dart';
import 'package:carli_et/features/student/presentation/student_home_page.dart';
import 'package:carli_et/features/student/presentation/browse_internships_page.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CarLi_Et',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color(0xFF087E8B),
        useMaterial3: true,
      ),
      
      home: const StudentHomePage(), 
    );
  }
}