
import 'package:todoflutter/todo/backend/todo/repository/TodoRepository.dart';
import 'package:todoflutter/todo/backend/todo/todo.dart';

class CreateTodoUseCase {
  TodoRepository _todoRepository = new TodoRepository();

  Future<Todo> execute(Todo t){
    return _todoRepository.add(t);
  }
}