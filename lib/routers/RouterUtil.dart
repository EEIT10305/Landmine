import 'package:flutter/cupertino.dart';
import 'package:landmine/widgets/pages/FileProviderPage.dart';
import 'package:landmine/widgets/pages/InheritedPracticePage.dart';
import 'package:landmine/widgets/pages/LandminePage.dart';
import 'package:landmine/widgets/pages/SelectionPage.dart';

class RouterUtil{
  static Map<String, WidgetBuilder> router = <String, WidgetBuilder> {
    "landmine": (context) => LandminePage(),
    "mytree": (context) => MyTree(),
    "homescreen":(context) => HomeScreen(),
    "fileprovider":(context) => FileProviderPage()
  };
}