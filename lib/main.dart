import 'package:flutter/material.dart';
import 'package:landmine/pages/FileProviderPage.dart';
import 'package:landmine/pages/SelectionPage.dart';
import 'package:landmine/util/LifeCycleManager.dart';
import 'package:landmine/widgets/ShowImage.dart';
import 'package:landmine/widgets/Square.dart';
import 'widgets/Landmine.dart';

void main() {
  runApp(
    LifeCycleManager(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
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
        child:HomeScreen(),//把下一頁的值傳回上一頁
//        child:Landmine(
//            data:data,
//            flags:flags,
//        ),//沒寫的踩地雷
//        child:FileProviderPage(
//          storage: InfoStorage(),
//          title: '日記',
//        ), //寫檔範例
      ),
    );
  }
}
