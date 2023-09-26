import 'package:flutter/material.dart';

class AssetScreen extends StatelessWidget {
  const AssetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset('images/kitten.jpg'),
      ),
    );
  }
}
