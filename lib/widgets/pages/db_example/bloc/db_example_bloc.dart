import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:landmine/controllers/DbExampleController.dart';
import 'package:landmine/managers/UserManager.dart';
import 'db_example_event.dart';
import 'db_example_state.dart';

class DbExampleBloc extends Bloc<DbExampleEvent, DbExampleState> {
  DbExampleController dbExampleController;

  @override
  DbExampleState get initialState => InitialFirePrmState();

  DbExampleBloc(){
    _initialData();
  }

  /*
   * 初始化資料
   * */
  void _initialData(){
    dbExampleController = DbExampleController();
  }

  @override
  Stream<DbExampleState> mapEventToState(DbExampleEvent event) async* {
    if (event is Query) {
      yield* _mapQuery();
    }
  }


  Stream<DbExampleState> _mapQuery() async*{
    yield QueryState(await dbExampleController.firstDbMethod());
  }
}
