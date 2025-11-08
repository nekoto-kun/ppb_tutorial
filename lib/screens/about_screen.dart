import 'package:flutter/material.dart';
import 'package:myapp/widgets/form_widget.dart';
import 'package:myapp/widgets/greetings_widget.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final String? data = ModalRoute.of(context)?.settings.arguments as String?;

    return Scaffold(
      appBar: AppBar(
        title: Text("About $data"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            }, 
            child: Text('Back'),
          ),
        ),
    );
  }
}
