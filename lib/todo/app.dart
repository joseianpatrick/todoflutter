import 'package:flutter/material.dart';
import 'package:todoflutter/todo/createtodo.dart';
import 'homescreen.dart';

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
        home: MyHomePage(),
        routes: <String, WidgetBuilder>{
        '/home': (BuildContext context) => this,
        '/createtodo': (BuildContext context) => CreateTodo()
      },
    );
  }
}