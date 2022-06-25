import '../models/dictionary_model.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'dart:io';

class DbHelper {
  String tblModel = "DictionaryDatabase";
  String colId = "id";
  String colType = "type";
  String colSample = "sample";
  String colWord = "word";
  String colFav = "favorite";
  String colMeaning = "meaning";

  DbHelper._internal();
  static final DbHelper instance = DbHelper._internal();
  static Database? _db;

  Future<Database?> get db async {
    if (_db == null) {
      _db = await initializeDb();
    }
    return _db;
  }

  factory DbHelper() {
    return instance;
  }

  Future<Database> initializeDb() async {
    Directory dir = await getApplicationDocumentsDirectory();
    String path = dir.path + "$tblModel.db";
    var dbDictionary =
        await openDatabase(path, version: 1, onCreate: _createDb);
    return dbDictionary;
  }

  void _createDb(Database db, int newVersion) async {
    await db.execute(
        "CREATE TABLE $tblModel($colId TEXT PRIMARY KEY, $colWord TEXT," +
            "$colMeaning TEXT," +
            "$colType TEXT," +
            "$colSample TEXT," +
            "$colFav INTEGER" +
            ")");
  }

  Future<int> insertWords(DictionaryModel dict) async {
    Database? db = await this.db;
    var result = await db!.insert(tblModel, dict.toMap());
    return result;
  }

  Future<bool> getWord(String id) async {
    Database? db = await this.db;
    List<Map<String, Object?>>? result =
        await db!.rawQuery("SELECT * FROM $tblModel WHERE id=$id");
    return result.isNotEmpty ? true : false;
  }

  Future<List<DictionaryModel>> getWords() async {
    List<DictionaryModel> dictList = [];
    Database? db = await this.db;
    var result = await db!.rawQuery("SELECT * FROM $tblModel");
    result.forEach((element) {
      dictList.add(DictionaryModel.fromMap(element));
    });
    return dictList;
  }

  Future<int> getCount() async {
    Database? db = await this.db;
    var result = Sqflite.firstIntValue(
        await db!.rawQuery("SELECT COUNT(*) FROM $tblModel"));

    return result!;
  }

  Future<int> updateDict(DictionaryModel model) async {
    Database? db = await this.db;
    var result = await db!.update(tblModel, model.toMap(),
        where: "$colId = ?", whereArgs: [model.id]);
    return result;
  }

  Future<int> deleteDict(String id) async {
    Database? db = await this.db;
    var result =
        await db!.delete(tblModel, where: "$colId = ?", whereArgs: [id]);
    return result;
  }
}
