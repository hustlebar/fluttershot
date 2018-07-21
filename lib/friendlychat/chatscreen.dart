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
      body: _eventWidgets(),
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
            ),

            GestureDetector(
              child: Container(
                child: IconButton(
                  icon: Icon(Icons.add),
//                  onPressed: () => print('Called'),
                ),
              ),
//              onLongPress: () => _onLongPressed
              onTapDown: (tabDownDetails) {
//                  print('Tab down');
//                  print(tabDownDetails.globalPosition.direction);
//                  print(tabDownDetails.globalPosition.distance);
              },
              onTapUp: (tabUpDetails) {
                print('Tab up');
                print(tabUpDetails.globalPosition.direction);
                print(tabUpDetails.globalPosition.distanceSquared);
                print(tabUpDetails.globalPosition.distance);
              },
            )
          ],
        ),
      ),
    );
  }

  Widget _eventWidgets() {
    return Container(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: <Widget>[
          Listener(
            onPointerDown: (downEvent) => _onPointerDown(downEvent),
            onPointerUp: (upEvent) => _onPointerUp(upEvent),
            child: Container(
              child: IconButton(
                icon: Icon(Icons.cloud_circle),
              )
            ),
          )
        ],
      ),
    );
  }

  void _onPointerDown(PointerDownEvent event) {
//    print('Enters pointer down');
//    print(event.delta.dx);
  }

  void _onPointerUp(PointerUpEvent event) {
    print('Enters pointer up event');
    print('position: ${event.position}');
    print('Pressure ${event.pressure}');
    print('Pressure min ${event.pressureMin}');
    print('Pressure max ${event.pressureMax}');
  }

  void _onSubmit(String value) {
    print('Value $value');
    _controller.clear();
  }
}