import 'package:flutter/material.dart';
import 'package:myapp/models/contact.dart';
import 'package:myapp/providers/contact_provider.dart';
import 'package:provider/provider.dart';

class ManageContactScreen extends StatelessWidget {
  const ManageContactScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final existingContact =
        ModalRoute.of(context)?.settings.arguments as Contact?;
    final isEdit = existingContact != null;

    final nameController = TextEditingController();
    final emailController = TextEditingController();
    final phoneController = TextEditingController();
    final addressController = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: Text(isEdit ? 'Edit Contact' : 'Add Contact')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(labelText: 'Name'),
            ),
            TextField(
              controller: emailController,
              decoration: const InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: phoneController,
              decoration: const InputDecoration(labelText: 'Phone'),
            ),
            TextField(
              controller: addressController,
              decoration: const InputDecoration(labelText: 'Address'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                final name = nameController.text;
                final email = emailController.text;
                final phone = phoneController.text;
                final address = addressController.text;

                final newContact = Contact(
                  id:
                      existingContact?.id ??
                      DateTime.now().millisecondsSinceEpoch.toString(),
                  name: name,
                  email: email,
                  phone: phone,
                  address: address,
                );

                if (isEdit) {
                  context.read<ContactProvider>().editContact(newContact);
                } else {
                  context.read<ContactProvider>().addContact(newContact);
                }

                Navigator.pop(context);
              },
              child: const Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}
