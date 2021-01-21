import 'package:landmine/managers/UserManager.dart';
import 'package:landmine/model/User.dart';

class DbExampleController{
  UserManager _userManager = UserManager.instance;

  Future<List<User>> firstDbMethod() async{
    //先查一下資料是否加入
    List<User> user = await _userManager.queryById('001');
    if(user.length == 0){
      _userManager.insert(User(
          uSERID: '001',
          uSERNAME: '一號',
          eMAIL: 'one@gmail.com',
          pASSWORD: 'onepass',
          uSERAUTHORITY: '0'));
    }
   return await _userManager.queryAll();
  }
}