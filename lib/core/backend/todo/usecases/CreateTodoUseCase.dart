
import 'package:todoflutter/core/backend/todo/repository/TodoRepository.dart';

import '../todo.dart';

class CreateTodoUseCase {
  TodoRepository _todoRepository = new TodoRepository();

  Future<Todo> execute(Todo t){
    return _todoRepository.add(t);
  }
}