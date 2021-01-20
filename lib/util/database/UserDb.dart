import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite_sqlcipher/sqflite.dart';

import 'UserScript.dart';

class UserDb {
  static final UserDb _instance = UserDb._();
  static Database _database;

  UserDb._();

  factory UserDb(){
    return _instance;
  }

  Future<Database> get db async{
    _database = await init();
    return _database;
  }

  Future<Database> init() async{
    Directory directory = await getApplicationDocumentsDirectory();
    String dbpath = join(directory.path, 'testUser', 'USER.db');
    Database database = openDatabase(dbpath, password: '',version: 1,onCreate: _onCreate, onUpgrade: _onUpgrade) as Database;
    return database;
  }

  void _onCreate(Database db, int version){
    db.execute(UserScript.CREATE_USER);
  }

  void _onUpgrade(Database db, int oldVersion, int newVersion){

  }

  Future closeDb() async{
    Database client = await db;
    client.close();
  }

}