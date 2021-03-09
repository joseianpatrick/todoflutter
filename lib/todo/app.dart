import 'package:flutter/material.dart';
import 'package:todoflutter/todo/createtodo.dart';
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
        home: MyHomePage(new TodoPresenter()),
        routes: <String, WidgetBuilder>{
        '/home': (BuildContext context) => this,
        '/createtodo': (BuildContext context) => CreateTodo()
      },
    );
  }
}