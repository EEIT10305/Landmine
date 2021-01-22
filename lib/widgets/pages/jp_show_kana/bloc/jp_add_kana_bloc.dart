import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:landmine/controllers/JPAddKanaController.dart';
import 'package:landmine/managers/UserManager.dart';
import 'jp_add_kana_event.dart';
import 'jp_add_kana_state.dart';

class JPAddKanaBloc extends Bloc<JPAddKanaEvent, JPAddKanaState> {
  JPAddKanaController dbExampleController;

  @override
  JPAddKanaState get initialState => InitialFirePrmState();

  JPAddKanaBloc(){
    _initialData();
  }

  /*
   * 初始化資料
   * */
  void _initialData(){
    dbExampleController = JPAddKanaController();
  }

  @override
  Stream<JPAddKanaState> mapEventToState(JPAddKanaEvent event) async* {

  }
}
