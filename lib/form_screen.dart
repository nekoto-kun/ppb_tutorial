import 'package:flutter/material.dart';

class FormScreen extends StatefulWidget {
  const FormScreen({super.key});

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  final _formKey = GlobalKey<FormState>();
  int? _value = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Form'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          children: [
            TextFormField(
              decoration: const InputDecoration(labelText: 'Email'),
              validator: (value) {
                return value!.isEmpty ? 'Email is required' : null;
              },
            ),
            const SizedBox(height: 16),
            DropdownButtonFormField(
              items: const [
                DropdownMenuItem(
                  value: 1,
                  child: Text('Option 1'),
                ),
                DropdownMenuItem(
                  value: 2,
                  child: Text('Option 2'),
                ),
              ],
              onChanged: (value) {
                setState(() {
                  _value = value;
                });
              },
              value: _value,
            ),
            const SizedBox(height: 16),
            Text('Selected value: $_value'),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Submitting data...')),
                  );
                }
              },
              child: const Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
