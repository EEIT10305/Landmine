import 'dart:io';

import 'JPScript.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite_sqlcipher/sqflite.dart';

class JPDb {
  static final JPDb _instance = JPDb._();
  static Database _database;

  final String _databaseName = "JP.db";
  final int _databaseVersion = 1;

  JPDb._();

  factory JPDb(){
    return _instance;
  }

  Future<Database> getDbConnection() async{
    if(_database == null || !_database.isOpen){
      return _instance.db;
    }
    return _database;
  }


  Future<Database> get db async{
    _database = await init();
    return _database;
  }

  Future<Database> init() async{
    Directory directory = await getApplicationDocumentsDirectory();
    String dbpath = join(directory.path, _databaseName);
    Database database = await openDatabase(dbpath, password: '', version: _databaseVersion, onCreate: _onCreate, onUpgrade: _onUpgrade);
    return database;
  }

  void _onCreate(Database db, int version){
    db.execute(JPScript.CREATE_KANA);
  }

  void _onUpgrade(Database db, int oldVersion, int newVersion){

  }

  Future<List<Map<String, dynamic>>> queryAll(String tableName) async{
    Database conn = await getDbConnection();
    return await conn.query(tableName);
  }

  Future<List<Map<String, dynamic>>> queryById(String tableName, String id) async{
    Database conn = await getDbConnection();
    return await conn.query(tableName, where: 'KANA_ID=?', whereArgs: [id]);
  }

  Future<int> insert(Map<String, dynamic> row, String tableName) async{
    Database conn = await getDbConnection();
    return conn.insert(tableName, row);
  }

  Future<int> delete(String id, String tableName) async{
    Database conn = await getDbConnection();
    return conn.delete(tableName, where: 'KANA_ID=?', whereArgs: [id]);
  }

  Future<int> update(Map<String, dynamic> row, String tableName) async{
    Database conn = await getDbConnection();
    return conn.update(tableName, row, where: 'KANA_ID=?', whereArgs: [row['KANA_ID']]);
  }

  Future closeDb() async{
    Database conn = await db;
    if(conn.isOpen){
      conn.close();
      print('關db');
    }
  }
}