import 'package:flutter/cupertino.dart';
import 'package:landmine/widgets/pages/FileProviderPage.dart';
import 'package:landmine/widgets/pages/InheritedPracticePage.dart';
import 'package:landmine/widgets/pages/LandminePage.dart';
import 'package:landmine/widgets/pages/SelectionPage.dart';
import 'package:landmine/widgets/pages/db_example/DbExamplePage.dart';
import 'package:landmine/widgets/pages/jp_show_kana/JPAddKanaPage.dart';

class RouterUtil{
  static Map<String, WidgetBuilder> router = <String, WidgetBuilder> {
    "landmine": (context) => LandminePage(),
    "homescreen":(context) => HomeScreen(),//資料丟給下一頁再傳回來
    "mytree": (context) => MyTree(),//inheritedWidget練習
    "fileprovider":(context) => FileProviderPage(),//寫檔讀檔練習
    "dbexample":(context) => DbExamplePage(),
    "jpdata":(context) => JPAddKanaPage(),
  };
}