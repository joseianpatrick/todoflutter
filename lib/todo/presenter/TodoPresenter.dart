
import 'package:flutter/material.dart';
import 'package:todoflutter/core/backend/todo/todo.dart';
import 'package:todoflutter/core/backend/todo/usecases/DeleteSelectedTodoUseCase.dart';
import 'package:todoflutter/core/backend/todo/usecases/GetAllTodoUseCase.dart';
import 'package:todoflutter/todo/view/TodoView.dart';

class TodoPresenter {



  TodoView todoView;

  GetAllTodoUseCase _getAllTodoUseCase = new GetAllTodoUseCase();

  DeleteSelectedTodoUseCase _deleteSelectedTodoUseCase = new DeleteSelectedTodoUseCase();

  TodoPresenter();

  buildListView() {

    _getAllTodoUseCase.execute().then((value) => todoView.setListView(value));

  }

  //in android this is like startactivityfor result
  Future createClick()  async {
      final dataFromSecondPage = await Navigator.pushNamed(
            todoView.getContext(),
            '/createtodo') as Todo;
      if (dataFromSecondPage != null) {
          todoView.addItem(new Todo(title: dataFromSecondPage.title,description: dataFromSecondPage.description,id: dataFromSecondPage.id));
      }
  }

  void deleteSelected(List<Todo> ts) {
    List<String> ids =[];
    for (var item in ts) {
      ids.add(item.id.toString());
    }

    _deleteSelectedTodoUseCase.execute(ids).then((value) => print(value));

  }
}