import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:landmine/widgets/MyScaffold.dart';
import 'bloc/bloc.dart';

class DbExamplePage extends StatefulWidget {
  @override
  _DbExamplePageState createState() => _DbExamplePageState();
}

class _DbExamplePageState extends State<DbExamplePage> {
  DbExampleBloc _dbExampleBloc;

  @override
  void initState() {
    super.initState();
    _dbExampleBloc = DbExampleBloc();
  }

  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      child: BlocProvider(
        create: (BuildContext context) => _dbExampleBloc,
        child: Center(
          child: Column(
            children: [
              FlatButton(
                  onPressed: () {
                    _dbExampleBloc.add(Query());
                  },
                  child: Text('查')),
              BlocBuilder<DbExampleBloc, DbExampleState>(
                  condition: (preState, currentState) {
                    if (currentState is QueryState) {
                      return true;
                    }
                    return false;
                  }, builder: (BuildContext context, DbExampleState state) {
                List<Map<String, dynamic>> list = List();
                if (state is QueryState) {
                  list = state.users.map((e) => e.toJson()).toList();
                  return TableWidget(
                    data: list,
                  );
                }
                return Container();
              }),
            ],
          ),
        ),
      )
    );
  }
}

class TableWidget extends StatefulWidget {
  final List<Map<String, dynamic>> data;

  const TableWidget({Key key, @required this.data}) : super(key: key);

  @override
  _TableWidgetState createState() => _TableWidgetState();
}

class _TableWidgetState extends State<TableWidget> {
  @override
  Widget build(BuildContext context) {
    print(widget.data);
    Map<int, TableColumnWidth> map = {};
    for (int i = 0 ; i < widget.data[0].keys.length ; i++){
      map[i] = FixedColumnWidth(150.0);
    }
    return Container(
      child: Table(
        columnWidths: map,
        children: [
          TableRow(children: <Widget>[
            for (String w in widget.data[0].keys)
              Container(
                decoration: BoxDecoration(color: Colors.yellow),
                child: Text(w),
              ),
          ]),
          for (Map<String, dynamic> d in widget.data)
            TableRow(children: <Widget>[
              for (dynamic w in d.values)
                ((w is Widget) ? w : Text(w.toString())),
            ])
        ],
      ),
    );
  }
}
