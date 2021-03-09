
import 'package:flutter/material.dart';
import 'package:todoflutter/core/backend/todo/todo.dart';
import 'package:todoflutter/core/backend/todo/usecases/CreateTodoUseCase.dart';
import 'package:todoflutter/core/backend/todo/usecases/UpdateTodoUseCase.dart';
import 'package:todoflutter/todo/view/TodoCreateView.dart';

class TodoCreatePresenter {
  
  TodoCreateView todoCreateView;

  CreateTodoUseCase _createTodoUseCase = new CreateTodoUseCase();
  UpdateTodoUseCase _updateTodoUseCase = new UpdateTodoUseCase();


  TodoCreatePresenter();
  Todo todo = new Todo();

  //get passed arguments
  void getArgs() {
    final Todo args = ModalRoute.of(todoCreateView.getContext()).settings.arguments;
    if(args!=null){
      todoCreateView.setTitle(args.title);
      todoCreateView.setDescription(args.description);
      todo.id = args.id;
      todo.title = args.title;
      todo.description = args.description;
    }
    
  }

  void saveClick(){
    if(todo.id==null){
      todo.title=todoCreateView.getTitle();
      todo.description=todoCreateView.getDescription();
      _createTodoUseCase.execute(todo).then((value) => Navigator.pop(todoCreateView.getContext(),value)); 
    }else{
      todo.title=todoCreateView.getTitle();
      todo.description=todoCreateView.getDescription();
      _updateTodoUseCase.execute(todo).then((value) => Navigator.pop(todoCreateView.getContext(),todo)); 
    }

  }
}