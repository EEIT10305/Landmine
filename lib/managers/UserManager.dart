import 'package:landmine/model/User.dart';
import 'package:landmine/util/database/UserDb.dart';

class UserManager {
  final UserDb db = UserDb();
  final String tableName = 'USER';

  static final UserManager instance = UserManager._();

  UserManager._();

  factory UserManager(){
    return instance;
  }

  Future<List<User>> queryAll() async{
    List<Map<String, dynamic>> users = await db.queryAll(tableName);
    return users.map((e)=>User.fromJson(e)).toList();
  }

  Future<List<User>> queryById(String id) async{
    List<Map<String, dynamic>> users = await db.queryById(tableName, id);
    return users.map((e)=>User.fromJson(e)).toList();
  }

  void insert(User user) async{
    await db.insert(user.toJson(), tableName);
  }

  void delete(String id) async{
    await db.delete(id, tableName);
  }

  void update(User user) async{
    await db.update(user.toJson(), tableName);
  }
}