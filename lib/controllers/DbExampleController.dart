import 'package:landmine/managers/UserManager.dart';
import 'package:landmine/model/User.dart';

class DbExampleController{
  UserManager _userManager = UserManager.instance;

  Future<List<User>> firstDbMethod() async{
    //先查一下資料是否加入
    User user = await _userManager.queryById('002');
    if(user == null){
      _userManager.insert(User(
          uSERID: '002',
          uSERNAME: '二號',
          eMAIL: 'two@gmail.com',
          pASSWORD: 'twopass',
          uSERAUTHORITY: '0'));
    }
   return await _userManager.queryAll();
  }

  void closeDb(){
    _userManager.closeDb();
  }
}