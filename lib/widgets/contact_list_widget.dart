import 'package:flutter/material.dart';
import 'package:myapp/providers/contact_provider.dart';
import 'package:myapp/screens/manage_contact_screen.dart';
import 'package:provider/provider.dart';

class ContactListWidget extends StatefulWidget {
  const ContactListWidget({super.key});

  @override
  State<ContactListWidget> createState() => _ContactListWidgetState();
}

class _ContactListWidgetState extends State<ContactListWidget> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
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