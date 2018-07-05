import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'friendlychat/friendlychat.dart';

void main() => runApp(new FriendlyChat());

class FlutterShot extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Shot',
      home: RandomWords(),
      theme: ThemeData(
        primaryColor: Colors.white
      ),
    );
  }
}

class RandomWordsState extends State<RandomWords> {
  final List<WordPair> _suggestions = <WordPair>[];
  final Set<WordPair> _saved = new Set<WordPair>();

  final TextStyle _biggerFont = const TextStyle(fontSize: 18.0);

  @override
  Widget build(BuildContext context) {
//    final WordPair wordPair = WordPair.random();
//    return Text(wordPair.asPascalCase);
//    return _buildSuggestions();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Shot'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.list),
            onPressed: _pushSaved,
          )
        ],
      ),
      body: Center(
        child: _buildSuggestions(),
      ),
    );
  }

  void _pushSaved() {
    Navigator.of(context).push(
        MaterialPageRoute<void>(
            builder: (BuildContext context) {
              final Iterable<ListTile> tiles = _saved.map((WordPair pair) {
                return ListTile(
                  title: Text(pair.asPascalCase, style: _biggerFont,),
                );
              });

              var divided = ListTile.divideTiles(context: context, tiles: tiles).toList();

              return Scaffold(
                appBar: AppBar(
                  title: const Text('Saved Titles'),
                ),
                body: ListView(children: divided,),
              );
            }
        )
    );
  }

  ListView _buildSuggestions() {
    return new ListView.builder(
      padding: const EdgeInsets.all(10.0),
      itemBuilder: (BuildContext _context, int i) {
        if (i.isOdd) {
          return Divider();
        }

        final int index = i ~/ 2;
        print(index);
        if (index >= _suggestions.length) {
          _suggestions.addAll(generateWordPairs().take(10));
        }

        return _buildRow(_suggestions[index]);
      }
    );
  }

  Widget _buildRow(WordPair wordPair) {
    final bool isSavedAlready = _saved.contains(wordPair);

    return ListTile(
      title: Text(wordPair.asPascalCase, style: _biggerFont,),
      trailing: Icon(
        isSavedAlready ? Icons.favorite : Icons.favorite_border,
        color: isSavedAlready ? Colors.red : null,
      ),
      onTap: () {
        setState(() {
          isSavedAlready ? _saved.remove(wordPair) : _saved.add(wordPair);
        });
      },
    );
  }
}

class RandomWords extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => RandomWordsState();
}