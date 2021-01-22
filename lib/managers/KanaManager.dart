import 'package:landmine/model/KANA.dart';
import 'package:landmine/util/database/JPDb.dart';

class KanaManager {
  final JPDb db = JPDb();
  final String tableName = 'KANA';

  static final KanaManager instance = KanaManager._();

  KanaManager._();

  factory KanaManager(){
    return instance;
  }

  Future<List<KANA>> queryAll() async{
    List<Map<String, dynamic>> kana = await db.queryAll(tableName);
    return kana.map((e)=>KANA.fromJson(e)).toList();
  }

  Future<KANA> queryById(String id) async{
    KANA kana;
    List<Map<String, dynamic>> kanas = await db.queryById(tableName, id);
    if(kanas.length > 0){
      kana = KANA.fromJson(kanas[0]);
    }
    return kana;
  }

  void insert(KANA user) async{
    await db.insert(user.toJson(), tableName);
  }

  void delete(String id) async{
    await db.delete(id, tableName);
  }

  void update(KANA user) async{
    await db.update(user.toJson(), tableName);
  }

  void closeDb() {
    db.closeDb();
  }
}