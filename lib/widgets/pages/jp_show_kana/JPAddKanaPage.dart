import 'dart:convert';
import 'dart:io';

import 'package:archive/archive.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:landmine/controllers/JPAddKanaController.dart';
import 'package:landmine/widgets/MyScaffold.dart';
import 'package:landmine/widgets/ShowImage.dart';
import 'package:path_provider/path_provider.dart';

class JPAddKanaPage extends StatefulWidget {
  @override
  _JPAddKanaPageState createState() => _JPAddKanaPageState();
}

class _JPAddKanaPageState extends State<JPAddKanaPage> {
  JPAddKanaController jPAddKanaController;

  @override
  void initState() {
    jPAddKanaController = JPAddKanaController();
    //加資料 : 確認是否有資料 => 創資料 => 存圖
    super.initState();
  }

  String base64_str = '';
  TextEditingController input = TextEditingController();

  @override
  Widget build(BuildContext context) {
    if (input.text != '') {}
    return MyScaffold(
        child: Center(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RaisedButton(
                child: Text('下載新db'),
                onPressed: () async {
                  try {
                    Dio dio = Dio();
                    Response response = await dio
                        .request("http://192.168.100.18:3000/api/JP.zip");
                    final directory = await getApplicationDocumentsDirectory();
                    File f = File('${directory.path}/JP.db');
                    var bytes = base64.decode(response.data);
                    Archive archive = ZipDecoder().decodeBytes(bytes);
                    f.writeAsBytesSync(archive[0].content);
                  } catch (e) {
                    print(e);
                  }
                },
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 200,
                margin: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                child: TextField(
                  controller: input,
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                child: RaisedButton(
                  child: Text('hiragana'),
                  onPressed: () async {
                    await jPAddKanaController.addData(input.text, '1');
                    base64_str = (await jPAddKanaController
                        .queryById(input.text, '1')).kANAIMG;
                    setState(() {});
                  },
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                child: RaisedButton(
                  child: Text('katakana'),
                  onPressed: () async {
                    await jPAddKanaController.addData(input.text, '2');
                    base64_str = (await jPAddKanaController
                        .queryById(input.text, '2')).kANAIMG;
                    setState(() {});
                  },
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ShowImage(base64: base64_str),
            ],
          ),
        ],
      ),
    ));
  }

  @override
  void dispose() {
//    關DB
    jPAddKanaController.closeDb();
    print('JPAddKana Bye Bye');
    super.dispose();
  }
}
