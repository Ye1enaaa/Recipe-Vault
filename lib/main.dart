import 'package:firstactivity/ui/Login%20&%20Register%20Page/login.dart';
import 'package:firstactivity/ui/onboarding_screen.dart';
import 'package:flutter/material.dart';
import 'ui/Root Page Folder/root_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'First Activity',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const OnboardingScreen(),
    );
  }
}

