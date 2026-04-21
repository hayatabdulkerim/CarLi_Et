import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:carli_internship_management/screens/auth_sign_up_page.dart';
import 'package:carli_internship_management/screens/auth_complete_profile_one.dart';
import 'package:carli_internship_management/screens/auth_complete_profile_two.dart';
import 'package:carli_internship_management/screens/auth_complete_profile_three.dart';
import 'package:carli_internship_management/screens/details_screen.dart';

final GoRouter router = GoRouter(
  initialLocation: '/signup',
  routes: [
    GoRoute(
      path: '/details/:id',
      builder: (context, state) => AuthSignUpPage(),
    ),
    GoRoute(
        path: '/details/:id',
      builder: (context, state) {
          final id = state.pathParameters['id'];
          return DetailsScreen(id: id!);
      }
    ),
  ]
);

final appRouter = GoRouter(
  initialLocation: '/signup',
  routes: [
    // Sign Up Page
    GoRoute(
      path: '/signup',
      builder: (context, state) => const AuthSignUpPage(),
    ),

    // Profile Completion Page One
    GoRoute(
      path: '/complete-profile-one',
      builder: (context, state) => const AuthCompleteProfileOne(),
    ),

    // Profile Completion Page Two
    GoRoute(
      path: '/complete-profile-two',
      builder: (context, state) => const AuthCompleteProfileTwo(),
    ),

    // Profile Completion Page Three
    GoRoute(
      path: '/complete-profile-three',
      builder: (context, state) => const AuthCompleteProfileThree(),
    )
  ]
);