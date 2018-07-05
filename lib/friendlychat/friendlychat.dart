import 'package:flutter/material.dart';

class FriendlyChat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Friendly Chat',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Friendly Chat'),
        ),
      ),
    );
  }
}