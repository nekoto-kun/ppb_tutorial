import 'package:flutter/material.dart';
import 'package:ppb_tutorial/widgets/post_list.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Demo'),
      ),
      body: const PostList(),
    );
  }
}
