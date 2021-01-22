import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:landmine/managers/KanaManager.dart';
import 'package:landmine/model/KANA.dart';
import 'package:path_provider/path_provider.dart';

class JPAddKanaController{
  KanaManager _kanaManager = KanaManager.instance;


  Future<String> addData(String text, String catogory) async{
    //確認是否有資料 => 創資料 => 找有沒有圖 => update時存圖

    //先查一下資料是否加入
    KANA kana = await _kanaManager.queryById('$text$catogory');
    if(kana == null){
      kana = KANA(
          kANAID: '$text$catogory',
          kANAONYOMI: text,
          kANAIMG: '',
          kANACATOGORY: catogory);
      _kanaManager.insert(kana);
    }

    //找圖片 有圖的話 更新db
    String base64 = await _findImg('${text}_${(catogory == '1') ? 'hira':'kata'}.png');
    if(base64 != ''){
      kana.kANAIMG = base64;
      _kanaManager.update(kana);
    }else{
      print('圖片不存在');
    }
    return base64;
  }

  Future<String> _findImg(String fileName) async{
    String base64 = '';
    final directory = await getApplicationDocumentsDirectory();
    File f = File('${directory.path}/img/$fileName');
    if(await f.exists()){
      Uint8List bytes = f.readAsBytesSync();
      base64 = base64Encode(bytes);
    }
    return base64;
  }

  void closeDb(){
    _kanaManager.closeDb();
  }
}