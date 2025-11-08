import 'package:flutter/material.dart';
import 'package:myapp/providers/contact_provider.dart';
import 'package:myapp/screens/about_screen.dart';
import 'package:myapp/screens/manage_contact_screen.dart';
import 'package:myapp/widgets/contact_list_widget.dart';
import 'package:myapp/widgets/form_widget.dart';
import 'package:myapp/widgets/greetings_widget.dart';
import 'package:myapp/widgets/post_list_widget.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    // GreetingsWidget(),
    PostListWidget(),
    FormWidget(),
    ContactListWidget(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        actions: [
          IconButton(
            icon: Icon(Icons.info_outline_rounded),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const AboutScreen(),
                  settings: const RouteSettings(
                    arguments: 'HELLOW',
                  ),
                ),
              );
            },
          ),
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: () {
              context.read<ContactProvider>().clearContacts();
            },
          ),
        ],
      ),
      body: _widgetOptions.elementAt(_selectedIndex),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ManageContactScreen(),
                ),
              );
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            tooltip: 'Halaman utama',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.layers),
            label: 'Form',
            tooltip: 'Form pendaftaran',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            label: 'Contacts',
            tooltip: 'Daftar kontak',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
