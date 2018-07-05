import 'package:flutter/material.dart';
import 'chatscreen.dart';

class FriendlyChat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Friendly Chat',
      home: ChatScreen(),
//      theme: ThemeData(primaryColor: Colors.red),
    );
  }
}