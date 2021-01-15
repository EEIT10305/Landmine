import 'dart:async';

import 'package:flutter/material.dart';
import 'package:landmine/pages/FileProviderPage.dart';
import 'package:landmine/pages/InheritedPracticePage.dart';
import 'package:landmine/pages/SelectionPage.dart';
import 'package:landmine/util/LifeCycleManager.dart';
import 'package:landmine/widgets/ShowImage.dart';
import 'package:landmine/widgets/Square.dart';
import 'package:landmine/widgets/dialogs/ShowAlertDialog.dart';
import 'widgets/Landmine.dart';

void main() {
   runZoned(() => runApp(
     LifeCycleManager(
       child: MyApp(),
     ),
   ),
     zoneSpecification: new ZoneSpecification(
       errorCallback :(Zone self, ZoneDelegate parent,
           Zone zone, Object error, StackTrace stackTrace){
         parent.print(zone, stackTrace.toString());
         return;
       },
       print: (Zone self, ZoneDelegate parent, Zone zone, String line) {
         parent.print(zone, "Intercepted: $line");
       }),
     onError: (e, stackTrace) => print('runZonedError: $e $stackTrace'),
   );

    FlutterError.onError = (FlutterErrorDetails details) {
      runApp(
        MaterialApp(
          home: ShowAlertDialog(content : details.toString()),
        ),
      );
    };
}



class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List data = [
    [1, -1, 1, 0, 0],
    [1, 1, 1, 0, 0],
    [1, 1, 2, 1, 1],
    [1, -1, 2, -1, 1],
    [1, 1, 2, 1, 1]
  ];
  List flags = [
    [false, false, false, false, false],
    [false, false, false, false, false],
    [false, false, false, false, false],
    [false, false, false, false, false],
    [false, false, false, false, false],
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
         child: MyTree(),//InheritedWidget範例

//        child:HomeScreen(),//把下一頁的值傳回上一頁

//        child:Landmine(
//            data:data,
//            flags:flags,
//        ),//沒寫的踩地雷
      ),
    );
  }
}
