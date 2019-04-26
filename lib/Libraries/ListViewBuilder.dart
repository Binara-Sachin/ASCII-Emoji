//import 'package:ascii_emoji/Assets/Emoticons.dart';
import 'package:ascii_emoji/Libraries/DatabaseManager.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

DatabaseManager database = DatabaseManager.instance;

class ListViewBuilder extends StatefulWidget {
  final bool favoritesOnly;
  final bool sortByCount;
  final String includeTag;

  const ListViewBuilder({Key key, this.favoritesOnly, this.includeTag, this.sortByCount}) : super(key: key);

  @override
  _ListViewBuilderState createState() => _ListViewBuilderState();
}

class _ListViewBuilderState extends State<ListViewBuilder> {
  final _biggerFont = const TextStyle(fontSize: 18.0);
  List<Emoticon> _displayList = emoticons;

  Widget _buildListView() {
    if (widget.favoritesOnly){
      _displayList = _displayList.where((i) => i.favorite).toList();
    }
    if (widget.includeTag != null){
       _displayList = _displayList.where((i) => i.tags.contains(widget.includeTag)).toList();
    }
    if (widget.sortByCount){
       _displayList.sort((b, a) => a.count.compareTo(b.count));
    }

    return ListView.builder(
      shrinkWrap: true,
      padding: const EdgeInsets.all(16.0),
      itemCount: _displayList.length,
      itemBuilder: (context, i) {
        return _buildRow(_displayList[i]);
      },
    );
  }

  Widget _buildRow(Emoticon emoticon) {
    final bool isFavorite = emoticon.favorite;

    return ListTile(
      title: Text(
        emoticon.text,
        style: _biggerFont,
      ),
      trailing: Icon(
        isFavorite ? Icons.favorite : Icons.favorite_border,
        color: isFavorite ? Colors.red : null,
      ),
      onTap: (){
        emoticon.count++;
        Clipboard.setData(new ClipboardData(text: emoticon.text));
        Scaffold.of(context).hideCurrentSnackBar();
        Scaffold.of(context).showSnackBar(
          SnackBar(
            content: Text("Copied to Clipboard"), 
            backgroundColor: Colors.blue,
          )
        );
        database.updateEmoticon(emoticon);
      },
      onLongPress: () {
        setState(() {
          emoticon.favorite = emoticon.favorite ? false : true;
        });
        database.updateEmoticon(emoticon);
      } 
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildListView();
  }
}
    