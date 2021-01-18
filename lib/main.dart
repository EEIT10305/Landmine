import 'dart:async';

import 'package:flutter/material.dart';
import 'package:landmine/routers/RouterUtil.dart';

import 'package:landmine/util/LifeCycleManager.dart';
import 'package:landmine/widgets/ShowImage.dart';
import 'package:landmine/widgets/Square.dart';
import 'package:landmine/widgets/dialogs/ShowAlertDialog.dart';
import 'package:landmine/widgets/pages/FileProviderPage.dart';
import 'package:landmine/widgets/pages/InheritedPracticePage.dart';

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
      routes:RouterUtil.router,
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
         child: Column(
           children: [
             FlatButton(onPressed: (){
               Navigator.of(context).pushNamed('landmine');
             }, child: Text('踩地雷(未完成)')),
             FlatButton(onPressed: (){
               Navigator.of(context).pushNamed('homescreen');
             }, child: Text('資料丟給下一頁再傳回來')),
             FlatButton(onPressed: (){
               Navigator.of(context).pushNamed('mytree');
             }, child: Text('inheritedWidget練習')),
             FlatButton(onPressed: (){
               Navigator.of(context).pushNamed('fileprovider', arguments: {'storage':InfoStorage(),'title':'標題'});
             }, child: Text('寫檔讀檔練習'))
           ],
         )
      ),
    );
  }
}
