import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:landmine/controllers/JPAddKanaController.dart';
import 'package:landmine/widgets/MyScaffold.dart';
import 'package:landmine/widgets/ShowImage.dart';

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

  String base64 = '';

  @override
  Widget build(BuildContext context) {
    TextEditingController input = TextEditingController();
    return MyScaffold(
        child: Center(
      child: Column(
        children: [
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
                  base64 = await jPAddKanaController.addData(input.text, '1');
                  setState(() {});
                },
              ),
              RaisedButton(
                  child: Text('katakana'),
                  onPressed: () async {
                    base64 = await jPAddKanaController.addData(input.text, '2');
                    setState(
                      () {},
                    );
                  },
              ),
              ShowImage(base64: base64),
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
    print('DbExample Bye Bye');
    super.dispose();
  }
}
