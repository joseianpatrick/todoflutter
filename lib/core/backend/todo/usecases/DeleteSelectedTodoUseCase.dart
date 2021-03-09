
import 'package:todoflutter/core/backend/todo/repository/TodoRepository.dart';

import '../todo.dart';

class DeleteSelectedTodoUseCase {
  TodoRepository _todoRepository = new TodoRepository();

  Future execute(List<String> ids){
    return _todoRepository.deleteAll(ids);
  }
}