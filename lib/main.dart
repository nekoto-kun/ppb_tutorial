import 'package:flutter/material.dart';
// import 'package:ppb_tutorial/asset_screen.dart';
import 'package:ppb_tutorial/form_screen.dart';
// import 'package:ppb_tutorial/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tutorial',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
        useMaterial3: true,
        fontFamily: 'Montserrat',
      ),
      home: const FormScreen(),
    );
  }
}
