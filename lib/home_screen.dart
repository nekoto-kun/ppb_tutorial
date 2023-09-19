import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: const Padding(
        padding: EdgeInsets.all(16),
        child: SimpleForm(),
      ),
    );
  }
}

class SimpleForm extends StatefulWidget {
  const SimpleForm({
    super.key,
  });

  @override
  State<SimpleForm> createState() => _SimpleFormState();
}

class _SimpleFormState extends State<SimpleForm> {
  final _namaLengkapController = TextEditingController();

  void onValueChange() {
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    _namaLengkapController.addListener(onValueChange);
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _namaLengkapController,
      decoration: InputDecoration(
        labelText: 'Nama lengkap',
        counterText: '${_namaLengkapController.text.length}',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
