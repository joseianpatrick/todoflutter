import 'package:todoflutter/core/data/Repository.dart';
import 'package:todoflutter/todo/backend/todo/todo.dart';

class TodoDataSource extends Repository<Todo> {
  @override
  Future<List<Todo>> getAll() {
    // TODO: implement update
    throw UnimplementedError();
  }
}