import 'dart:io';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

import 'package:ascii_emoji/Assets/Emoticons.dart';

final String tableName = 'emoticons_table';
final String columnId = '_id';
final String columnEmoticon = 'text';
final String columnFavorite = 'favorite';
final String columnCount = 'count';
final String columnTags = 'tags';

List<Emoticon> emoticons = [];

class Emoticon {
  int id;
  String text;
  bool favorite = false;
  int count = 0;
  String tags;

  Emoticon({this.id, this.text, this.favorite, this.count, this.tags});

  Emoticon.fromMap(Map<String, dynamic> map) {
    id = map[columnId];
    text = map[columnEmoticon];
    favorite = map[columnFavorite] == 1 ? true : false;
    count = map[columnCount];
    tags = map[columnTags];
  }

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      columnEmoticon : text==null ? "empty" : text,
      columnFavorite : favorite==null ? 0 : (favorite ? 1 : 0),
      columnCount : count==null ? 0 : count,
      columnTags : tags==null ? "empty" : tags,
    };
    
    if (id != null) {
      map[columnId] = id;
    }
      return map;
  }
}


class DatabaseManager {
  static final _databaseName = "EmoticonsDatabase.db";
  static final _databaseVersion = 1;

  DatabaseManager._privateConstructor();
  static final DatabaseManager instance = DatabaseManager._privateConstructor();
  static Database _database;

  Future<Database> get database async {
    if (_database != null) return _database;
    _database = await _initDatabase();
    return _database;
  }

  _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, _databaseName);
    return await openDatabase(
      path,
      version: _databaseVersion,
      onCreate: _onCreate
    );
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
          CREATE TABLE $tableName (
            $columnId INTEGER PRIMARY KEY,
            $columnEmoticon TEXT NOT NULL,
            $columnFavorite INTEGER NOT NULL,
            $columnCount INTEGER NOT NULL,
            $columnTags TEXT NOT NULL
          )
    ''');
  }

  Future<int> insertEmoticon(Emoticon emo) async {
    Database db = await database;
    int id = await db.insert(tableName, emo.toMap());
    return id;
  }

  Future<Emoticon> queryEmoticon(int id) async {
    Database db = await database;
    List<Map> emoticon = await db.query(tableName,
        columns: [columnId, columnEmoticon, columnFavorite, columnCount, columnTags],
        where: '$columnId = ?',
        whereArgs: [id]);
    if (emoticon.length > 0) {
      return Emoticon.fromMap(emoticon.first);
    }
    return null;
  }

  Future<List<Emoticon>> queryAllEmoticons() async {
    Database db = await database;
    final List<Map<String, dynamic>> emoticonsList = await db.query(tableName);
    return List.generate(emoticonsList.length, (i) {
      return Emoticon(
        id: emoticonsList[i]['id'],
        text: emoticonsList[i]['text'],
        favorite: emoticonsList[i]['favorite'] == 1 ? true : false,
        count: emoticonsList[i]['count'],
        tags: emoticonsList[i]['tags'],
      );
    });
  }

  Future<void> updateEmoticon(Emoticon emoticon) async {
    final db = await database;
    await db.update(
      tableName,
      emoticon.toMap(),
      where: "_id = ?",
      whereArgs: [emoticon.id],
    );
  }

  Future<void> updateAllEmoticons() async {
    final db = await database;
    for (int i=0; i<emoticons.length; i++){
      await db.update(
      tableName,
      emoticons[i].toMap(),
      where: "_id = ?",
      whereArgs: [i+1],
      );
    }
  }

  Future<void> deleteEmoticon(int id) async {
  final db = await database;
  await db.delete(
    tableName,
    where: "_id = ?",
    whereArgs: [id],
  );
}

  startDatabase() async {
    _initDatabase();
    emoticons = await queryAllEmoticons();
    if (emoticons.length==0) {
      for (int i=0; i<sampleEmoticonsList.length; i++){
        Emoticon emo = new Emoticon(
          id: i+1,
          text: sampleEmoticonsList[i].text,
          favorite: false,
          count: 0,
          tags: sampleEmoticonsList[i].tags.toString(),
        );
        /*
        Emoticon cEmo = await queryEmoticon(i);
        if(cEmo!=null){
          await deleteEmoticon(i);
        }
        */
        int id = await insertEmoticon(emo);
        print('inserted row: $id ${emo.text}');
      }
    }
    emoticons = await queryAllEmoticons();
  }
}