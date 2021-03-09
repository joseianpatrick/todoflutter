import 'package:todoflutter/core/data/Repository.dart';

import '../todo.dart';

class TodoDataSource extends Repository<Todo> {
  Future<List<Todo>> getAll() {}
  Future deleteAll(List<String> todos) {}
}