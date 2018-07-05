import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ChatScreenState();
  }
}

class ChatScreenState extends State<ChatScreen> {
  final TextEditingController _controller = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Friendly Chat'),
      ),
      body: _buildTextComposer(),
    );
  }

  Widget _buildTextComposer() {
    return IconTheme(
      data: IconThemeData(
        color: Theme.of(context).accentColor
      ),
      child: Container(
        margin: const EdgeInsets.all(10.0),
        child: Row(
          children: <Widget>[
            Flexible(
              child: TextField(
                controller: _controller,
                onSubmitted: _onSubmit,
                decoration: const InputDecoration.collapsed(hintText: 'Send a message'),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 5.0),
              child: IconButton(
                icon: Icon(Icons.send),
                onPressed: () => _onSubmit(_controller.text),
              ),
            )
          ],
        ),
      ),
    );
  }

  void _onSubmit(String value) {
    print('Value $value');
    _controller.clear();
  }
}