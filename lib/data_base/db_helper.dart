import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DB {
  static Database? _db;
  Future<Database?> get db async {
    if (_db == null) {
      _db = await initialDB();
      return _db;
    } else {
      return _db;
    }
  }

  initialDB() async {
    String originalPath = await getDatabasesPath();
    String databaseName = "notes.db";
    String path = join(originalPath, databaseName);
    Database db = await openDatabase(path,
        onCreate: _onCreate, version: 2, onUpgrade: _onUpgrade);

    return db;
  }

  _onCreate(Database db, int version) async {
    await db.execute('''
    CREATE TABLE NOTES(
    'ID' INTEGER PRIMARY KEY AUTOINCREMENT,
    'JOBTITLE' TEXT NOT NULL ,
    'DONE' INTEGER
    )
    ''');
  }

  _onUpgrade(Database db, int oldVersion, int newVersion) async {
    await db.execute('''
      ALTER TABLE NOTES 
      RENAME JOBTITLE TO TODO
      ''');
  }

  selectRow(String sql) async {
    Database? database = await db;
    List<Map> response = await database!.rawQuery(sql);
    return response;
  }

  insertRow(String sql) async {
    Database? database = await db;
    var response = await database!.rawInsert(sql);
    return response;
  }

  updateRow(String sql) async {
    Database? database = await db;
    var response = await database!.rawUpdate(sql);
    return response;
  }

  deleteRow(String sql) async {
    Database? database = await db;
    var response = await database!.rawDelete(sql);
    return response;
  }

  //////////////////////////
  select(String table) async {
    Database? database = await db;
    List<Map> response = await database!.query(table);
    return response;
  }

  insert(String table, Map<String, Object> values) async {
    Database? database = await db;
    var response = await database!.insert(table, values);
    return response;
  }

  update(String table, Map<String, Object> values, String where) async {
    Database? database = await db;
    var response = await database!.update(table, values, where: where);
    return response;
  }

  delete(String table, String where) async {
    Database? database = await db;
    var response = await database!.delete(table, where: where);
    return response;
  }
}
