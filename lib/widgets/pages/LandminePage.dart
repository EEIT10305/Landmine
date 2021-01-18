import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:landmine/widgets/Landmine.dart';

class LandminePage extends StatefulWidget {
  @override
  _LandminePageState createState() => _LandminePageState();
}

class _LandminePageState extends State<LandminePage> {
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
        title: Text(''),
      ),
      body: Container(
        child: Landmine(
          data: data,
          flags: flags,
        ), //沒寫的踩地雷
      ),
    );
  }
}
