import 'package:flutter/material.dart';
import 'package:todoflutter/todo/createtodo.dart';
import 'package:todoflutter/todo/presenter/TodoCreatePresenter.dart';
import 'package:todoflutter/todo/presenter/TodoPresenter.dart';
import 'todoscreen.dart';

// import 'package:flutter/rendering.dart';

class App extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    // debugPaintSizeEnabled = true;
    return MaterialApp(
        debugShowCheckedModeBanner: false,
      
        theme: ThemeData(
          primaryColor: Colors.white
        ),
        home: TodoScreen(new TodoPresenter()),
        routes: <String, WidgetBuilder>{
        TodoScreen.routeName: (BuildContext context) => this,
        CreateTodo.routeName: (BuildContext context) => CreateTodo(todoCreatePresenter: new TodoCreatePresenter())
      },
    );
  }
}