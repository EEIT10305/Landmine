import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gbk_codec/gbk_codec.dart';
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

  String gbkDecoder(List<int> responseBytes, RequestOptions options, ResponseBody responseBody) {
    return gbk_bytes.decode(responseBytes);
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController input = TextEditingController();
    return MyScaffold(
        child: Center(
      child: Column(
        children: [
          Row(
            children: [
              RaisedButton(
                child: Text('下載新db'),
                onPressed: () async {
                  try {
                    Dio dio = Dio();
                    Response response = await dio.request("http://192.168.100.18:3000/api/JP.zip");
                    final directory = await getApplicationDocumentsDirectory();
                    File f = File('${directory.path}/JP.zip');
                    var bytes = base64.decode(response.data);
                    f.writeAsBytesSync(bytes);
                  } catch (e) {
                    print(e);
                  }},
              )
            ],
          ),
          Row(
            children: [
              Container(
                width: 500,
                child: TextField(
                  controller: input,
                ),
              ),
              RaisedButton(
                child: Text('hiragana'),
                onPressed: () async {
                  base64_str = await jPAddKanaController.addData(input.text, '1');
                  setState(() {});
                },
              ),
              RaisedButton(
                child: Text('katakana'),
                onPressed: () async {
                  base64_str = await jPAddKanaController.addData(input.text, '2');
                  setState(
                    () {},
                  );
                },
              ),
              ShowImage(base64: base64_str),
            ],
          )
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
