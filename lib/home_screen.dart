import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.save),
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
  final _tglLahirController = TextEditingController();

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
    return Column(
      children: [
        TextField(
          controller: _namaLengkapController,
          decoration: InputDecoration(
            labelText: 'Nama lengkap',
            counterText: '${_namaLengkapController.text.length}',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
        const SizedBox(height: 16),
        TextField(
          controller: _tglLahirController,
          decoration: InputDecoration(
            labelText: 'Tanggal Lahir',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          onTap: () async {
            final date = await showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime(1970),
              lastDate: DateTime(2100),
            );

            if (date != null) {
              _tglLahirController.text =
                  DateFormat('dd MMMM yyyy').format(date);
            }
          },
        ),
      ],
    );
  }
}
