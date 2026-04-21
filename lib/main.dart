import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:carli_internship_management/services/app_router.dart';
import 'package:carli_internship_management/screens/auth_sign_up_page.dart';
import 'package:carli_internship_management/screens/auth_complete_profile_one.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'CarLi_ET',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color(0xFF008080),
        ),
        useMaterial3: true,
      ),
      routerConfig: appRouter,
    );
  }
}