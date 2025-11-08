import 'package:flutter/material.dart';
import 'package:myapp/providers/contact_provider.dart';
import 'package:myapp/screens/home_screen.dart';
import 'package:provider/provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: 'https://dkziyrgdwttjyapbedaf.supabase.co',
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImRreml5cmdkd3R0anlhcGJlZGFmIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NjI1NjY2NTUsImV4cCI6MjA3ODE0MjY1NX0.pz9HcumeduqV-CYfSkg9wqdsBzk_h6zutfWruAhmQJA',
  );

  runApp(
    ChangeNotifierProvider(
        create: (context) => ContactProvider(),
        child: const MyApp(),
      ),
    );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tutorial',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
      ),
      home: const HomeScreen(),
    );
  }
}
