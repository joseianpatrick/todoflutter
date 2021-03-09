
import 'package:todoflutter/todo/backend/todo/repository/TodoRepository.dart';
import 'package:todoflutter/todo/backend/todo/todo.dart';

class GetAllTodoUseCase {
  TodoRepository _todoRepository = new TodoRepository();

  Future<List<Todo>> execute() async{
    return _todoRepository.getAll();
  }
}