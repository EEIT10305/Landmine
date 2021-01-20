import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:landmine/managers/UserManager.dart';
import 'db_example_event.dart';
import 'db_example_state.dart';

class DbExampleBloc extends Bloc<DbExampleEvent, DbExampleState> {
  @override
  DbExampleState get initialState => InitialFirePrmState();

  @override
  Stream<DbExampleState> mapEventToState(DbExampleEvent event) async* {
    if (event is Query) {
      yield* _mapQuery();
    }
  }

  Stream<DbExampleState> _mapQuery() async*{
    UserManager userManager = UserManager.instance;
//    userManager.insert(User(
//        uSERID: '001',
//        uSERNAME: '一號',
//        eMAIL: 'one@gmail.com',
//        pASSWORD: 'onepass',
//        uSERAUTHORITY: '0'));

    yield QueryState(await userManager.queryAll());
  }
}
