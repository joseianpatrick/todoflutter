
import 'package:flutter/cupertino.dart';
import 'package:todoflutter/todo/backend/todo/todo.dart';
import 'package:todoflutter/todo/backend/todo/usecases/GetAllTodoUseCase.dart';
import 'package:todoflutter/todo/view/TodoView.dart';

class TodoPresenter {
  TodoView todoView;
  BuildContext context;
  GetAllTodoUseCase _getAllTodoUseCase = new GetAllTodoUseCase();

  TodoPresenter();
      // body: FutureBuilder<List<Todo>>(
      //                 future: widget._todoPresenter.setList(), 
      //                 builder: (context, snapshot) {
      //                   // if (snapshot.hasError) print(snapshot.error); 
      //                   // return snapshot.hasData ? TodoList(todos: snapshot.data) 
      //                   if(snapshot.hasError) print(snapshot.error);
      //                     if(snapshot.hasData){
      //                       return TodoList(todos: snapshot.data);
      //                     } 
      //                   List<Todo> todos = [];
      //                   return TodoList(todos: todos);
      //                   // return the ListView widget : 
      //                   // Center(child: CircularProgressIndicator()); 
      //             },
      //           ),
  Future<List<Todo>> setList(){
    // List<Todo> todos = _getAllTodoUseCase.execute();
    return _getAllTodoUseCase.execute();
    // print('test1');
  }


  buildListView() {
    _getAllTodoUseCase.execute().then((value) => todoView.setListView(value));
  }

  //in android this is like startactivityfor result
  Future createClick()  async {
      final dataFromSecondPage = await Navigator.pushNamed(
            context,
            '/createtodo') as Todo;
    if (dataFromSecondPage != null) {
        todoView.addItem(new Todo(title: dataFromSecondPage.title,description: dataFromSecondPage.description));
    }
  }

}