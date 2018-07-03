import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

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
          child: RandomWords(),
        ),
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
    return _buildSuggestions();
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