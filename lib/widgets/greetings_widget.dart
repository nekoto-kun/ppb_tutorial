import 'package:flutter/material.dart';

class GreetingsWidget extends StatelessWidget {
  const GreetingsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const DefaultTabController(
      length: 3,
      child: Column(
        children: [
          TabBar(
            tabs: [
              Tab(text: 'A'),
              Tab(text: 'B'),
              Tab(text: 'C'),
            ],
          ),
          Expanded(
            child: TabBarView(
              children: [
                Center(child: Text('Tab content A')),
                Center(child: Text('Tab content B')),
                Center(child: Text('Tab content C')),
              ],
            ),
          ),
        ],
      ),
    );
  }
}