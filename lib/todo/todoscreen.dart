import 'package:flutter/material.dart';
import 'package:todoflutter/todo/presenter/TodoPresenter.dart';
import 'package:todoflutter/todo/view/TodoView.dart';
import 'todolist.dart';
import 'backend/todo/todo.dart';
import 'dart:async' show Future;

class MyHomePage extends StatefulWidget {

  final TodoPresenter _todoPresenter;

  MyHomePage(this._todoPresenter,{Key key, this.todo}) : super(key: key);


  final Todo todo;


  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> implements TodoView{

  Future<List<Todo>> ftodos;
  List<Todo> todos = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    widget._todoPresenter.todoView = this;
    widget._todoPresenter.buildListView();
  }

  
    _showDeleteTodoDialog(BuildContext context){
    return showDialog(context: context,barrierDismissible: true,builder: (param){
      return AlertDialog(
        actions: <Widget>[
          FlatButton(
            onPressed: () => Navigator.pop(context), 
            child: Text(
              'Close',
              )
            ),
          FlatButton(
            onPressed: () {
              todos.removeWhere((element) => element.checked);
              setState(() {}); 
              Navigator.pop(context);
            }, 
            child: Text(
              'Delete',
              style: TextStyle(color: Colors.red),
              )
          )
        ],
        title: Text('Delete Todo/s'),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    widget._todoPresenter.context = context;

    return Scaffold(
      appBar: AppBar(
        title: Text("To Do List"),
        actions: [
          IconButton(
            icon: Icon(
              Icons.delete,
              color: Colors.red,
              ), 
          onPressed: () => _showDeleteTodoDialog(context))
        ],
      ),
      body: TodoList(todos: todos) 
      ,
      floatingActionButton: FloatingActionButton(
        tooltip: 'Create To Do',
        child: Icon(Icons.add),
        onPressed: () =>  widget._todoPresenter.createClick(), 
      )
    );
  }


  @override
  void setListView(List<Todo> todos) {
    // TODO: implement setListView
      setState(() {
        this.todos = todos;
      });
  }

  @override
  void addItem(Todo todo) {
    // TODO: implement addItem
     setState(() {
        this.todos.add(todo);
      });
  }
}


