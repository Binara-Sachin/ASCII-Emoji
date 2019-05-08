import 'package:ascii_emoji/Assets/Emoticons.dart';
import 'package:ascii_emoji/Assets/GlobalData.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ListViewBuilder extends StatefulWidget {
  final bool favoritesOnly;
  final String includeTag;

  const ListViewBuilder({Key key, this.favoritesOnly, this.includeTag}) : super(key: key);

  @override
  _ListViewBuilderState createState() => _ListViewBuilderState();
}

class _ListViewBuilderState extends State<ListViewBuilder> {
  final _biggerFont = const TextStyle(fontSize: 18.0);
  List<Emoticon> _displayList;

  Widget _buildListView() {
    if (widget.favoritesOnly) {
      _displayList = emoticonsList.where((i) => i.favorite).toList();
      print(_displayList.length.toString());
    }
    else if (widget.includeTag != null) {
      _displayList = emoticonsList.where((i) => i.tags.contains(widget.includeTag)).toList();
      print(_displayList.length.toString());
    }
    else{
      _displayList = emoticonsList;
    }
    if (globalSortByUsage) {
      _displayList.sort((b, a) => a.count.compareTo(b.count));
    }
    if (globalShowFavoritesOnTop) {
      _displayList.sort((b, a) => (a.favorite ? 1 : 0).compareTo(b.favorite ? 1 : 0));
    }

    return ListView.builder(
      shrinkWrap: true,
      padding: const EdgeInsets.all(16.0),
      itemCount: _displayList.length,
      itemBuilder: (context, i) {
        return _buildRow(emoticonsList[_displayList[i].id]);
      },
    );
  }

  Widget _buildRow(Emoticon emo) {
    print(
        emo.id.toString() + " " + 
        emo.favorite.toString() + " " + 
        emo.count.toString() + " " + 
        emo.emoji.toString());

    return ListTile(
        title: Text(
          emo.emoji,
          style: _biggerFont,
        ),
        trailing: Icon(
          emo.favorite ? Icons.favorite : Icons.favorite_border,
          color: emo.favorite ? Colors.red : null,
        ),
        onTap: () {
          emo.count++;
          Clipboard.setData(new ClipboardData(text: emo.emoji));
          Scaffold.of(context).hideCurrentSnackBar();
          Scaffold.of(context).showSnackBar(SnackBar(
            content: Text("Copied to Clipboard"),
            backgroundColor: Colors.blue,
          ));
          updatePreferences(emo.id);
        },
        onLongPress: () {
          setState(() {
            emo.favorite = emo.favorite ? false : true;
          });
          updatePreferences(emo.id);
        });
  }

  @override
  Widget build(BuildContext context) {
    return _buildListView();
  }
}
