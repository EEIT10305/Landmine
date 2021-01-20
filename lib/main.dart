import 'dart:async';

import 'package:flutter/material.dart';
import 'package:landmine/routers/RouterUtil.dart';

import 'package:landmine/util/LifeCycleManager.dart';
import 'package:landmine/widgets/FirstButton.dart';
import 'package:landmine/widgets/MyScaffold.dart';
import 'package:landmine/widgets/dialogs/ShowAlertDialog.dart';
import 'package:landmine/widgets/pages/FileProviderPage.dart';

void main() {
  // runZoned(
  //   () => runApp(
  //     LifeCycleManager(
  //       child: MyApp(),
  //     ),
  //   ),
  //   zoneSpecification: new ZoneSpecification(errorCallback: (Zone self,
  //       ZoneDelegate parent, Zone zone, Object error, StackTrace stackTrace) {
  //     parent.print(zone, stackTrace.toString());
  //     return;
  //   }, print: (Zone self, ZoneDelegate parent, Zone zone, String line) {
  //     parent.print(zone, "Intercepted: $line");
  //   }),
  //   onError: (e, stackTrace) => print('runZonedError: $e $stackTrace'),
  // );

  runZonedGuarded(() {
    runApp(LifeCycleManager(
      child: MyApp(),
    ));
  }, (Object error, StackTrace stack) {
    print('runZonedError: $error $stack');
  });

  FlutterError.onError = (FlutterErrorDetails details) {
    runApp(
      MaterialApp(
        home: ShowAlertDialog(content: details.toString()),
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
        primarySwatch: Colors.grey,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      routes: RouterUtil.router,
      home: MyHomePage(title: 'Flutter Demo Home Page'),
//      builder: (context, widget) {
//        return MediaQuery(
//          //設置文字大小不隨系統設置改變
//          data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
//          child: widget,
//        );
//      },
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
    return MyScaffold(
      child: Container(
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FirstButton(
              routerName: 'landmine',
              buttonWord: '踩地雷(未完成)',
            ),
            FirstButton(
              routerName: 'homescreen',
              buttonWord: '資料丟給下一頁再傳回來',
            ),
            FirstButton(
              routerName: 'mytree',
              buttonWord: 'inheritedWidget練習',
            ),
            FirstButton(
              routerName: 'fileprovider',
              buttonWord: '寫檔讀檔練習',
              args: {'storage': InfoStorage(), 'title': '標題'},
            ),
          ],
        )),
      ),
    );
  }
}
