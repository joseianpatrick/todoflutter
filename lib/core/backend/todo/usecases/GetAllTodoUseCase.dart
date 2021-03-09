

import 'package:todoflutter/core/backend/todo/repository/TodoRepository.dart';

import '../todo.dart';

class GetAllTodoUseCase {
  TodoRepository _todoRepository = new TodoRepository();

  Future<List<Todo>> execute() async{
    return _todoRepository.getAll();
  }
}