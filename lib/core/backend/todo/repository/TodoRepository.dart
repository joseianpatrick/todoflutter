

import 'package:todoflutter/core/backend/todo/repository/source/network/TodoNetworkDataSource.dart';

import '../todo.dart';
import 'TodoDataSource.dart';

class TodoRepository implements TodoDataSource {

  TodoNetworkDataSource _todoNetworkDataSource = new TodoNetworkDataSource();

  @override
  Future<Todo> add(Todo t) {
      // TODO: implement add
    return _todoNetworkDataSource.add(t);
  }

  @override
  Future<Todo> delete(Todo t) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<Todo> update(Todo t) {
  // TODO: implement update
    return _todoNetworkDataSource.update(t);
  }

  @override
  Future<List<Todo>> getAll() async{
    // TODO: implement getAll
    return _todoNetworkDataSource.getAll();
  }

  @override
  Future deleteAll(List<String> todos) {
    // TODO: implement deleteAll
    return _todoNetworkDataSource.deleteAll(todos);
  }
  

}