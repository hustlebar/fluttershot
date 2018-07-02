import 'package:flutter/material.dart';

void main() => runApp(new FlutterShot());

class FlutterShot extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Shot',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Flutter Shot'),
        ),
        body: Center(
          child: const Text('Hello Flutter Shot!'),
        ),
      ),
    );
  }
}