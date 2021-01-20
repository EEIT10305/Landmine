import 'package:landmine/model/User.dart';

abstract class DbExampleState{}

class InitialFirePrmState extends DbExampleState {}

class QueryState extends DbExampleState{
  final List<User> users;
  QueryState(this.users);
}