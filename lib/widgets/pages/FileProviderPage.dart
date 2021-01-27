import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

import '../MyScaffold.dart';

class FileProviderPage extends StatefulWidget {
  final InfoStorage storage = InfoStorage();
  final String title;

  FileProviderPage({Key key, this.title}) : super(key: key);

  @override
  _FileProviderPageState createState() => _FileProviderPageState();
}

class _FileProviderPageState extends State<FileProviderPage> {
  final TextEditingController textTitleEditingController =
      TextEditingController();
  String _info;

  @override
  void initState() {
    super.initState();
    widget.storage._localFile.then((file) async {
      bool exist = await file.exists();
      if (exist) {
        widget.storage.readInfo().then((String info) {
          setState(() {
            _info = info;
          });
        });
      } else {
        file.create();
      }
    });
  }

  Future<File> _saveInfo() async {
    setState(() {
      _info = textTitleEditingController.text;
    });
    return widget.storage.writeInfo(_info);
  }

  @override
  Widget build(BuildContext context) {
    Map args = ModalRoute.of(context).settings.arguments;
    print(args);
    return MyScaffold(
      title: args['title'],
      child: Column(
        verticalDirection: VerticalDirection.down,
        children: [
          TextField(
            controller: textTitleEditingController,
            autofocus: true,
            decoration: InputDecoration(
              hintText: _info,
            ),
          ),
          RaisedButton(
            child: Text('儲存'),
            onPressed: _saveInfo,
          ),
          Text(_info ?? ''),
        ],
      ),
    );
  }
}

class InfoStorage {
  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/info.txt');
  }

  Future<String> readInfo() async {
    try {
      final file = await _localFile;
      String info = file.readAsStringSync();
      print(info);
      return info;
    } catch (e) {
      print(e);
      return 'no content';
    }
  }

  Future<File> writeInfo(String info) async {
    final file = await _localFile;
    return file.writeAsString(info);
  }
}
