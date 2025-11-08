import 'package:flutter/material.dart';
import 'package:myapp/providers/contact_provider.dart';
import 'package:myapp/screens/manage_contact_screen.dart';
import 'package:provider/provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ContactListWidget extends StatefulWidget {
  const ContactListWidget({super.key});

  @override
  State<ContactListWidget> createState() => _ContactListWidgetState();
}

class _ContactListWidgetState extends State<ContactListWidget> {
  final _future = Supabase.instance.client
      .from('contacts')
      .select();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _future,
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(child: CircularProgressIndicator());
        }

        final contacts = snapshot.data!;

        return ListView.builder(
          itemCount: contacts.length,
          itemBuilder: (context, index) {
            final contact = contacts[index];

            return ListTile(
              title: Text(contact['name']),
              subtitle: Text(contact['email']),
            );
          }
        );
      }
    );
  }
}

// class ContactListWidget extends StatelessWidget {
//   const ContactListWidget({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Consumer<ContactProvider>(
//       builder: (context, provider, _) {
//         if (provider.contacts.isEmpty) {
//           return const Center(
//             child: Text('No contacts'),
//           );
//         }

//         return ListView.builder(
//           itemCount: provider.contacts.length,
//           itemBuilder: (context, index) {
//             final contactItem = provider.contacts[index];

//             return ListTile(
//               title: Text(contactItem.name),
//               subtitle: Text(contactItem.email),
//               leading: CircleAvatar(
//                 child: Text(contactItem.name[0]),
//               ),
//               trailing: IconButton(
//                 icon: const Icon(Icons.delete),
//                 onPressed: () {
//                   provider.removeContact(contactItem);
//                 },
//               ),
//               onTap: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) => const ManageContactScreen(),
//                     settings: RouteSettings(arguments: contactItem),
//                   )
//                 );
//               }
//             );
//           },
//         );
//       }
//     );
//   }
// }