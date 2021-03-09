import 'package:flutter/material.dart';
import 'package:todoflutter/core/backend/todo/todo.dart';
import 'package:todoflutter/todo/presenter/TodoPresenter.dart';
import 'package:todoflutter/todo/view/TodoView.dart';
import 'todolist.dart';
import 'dart:async' show Future;

class TodoScreen extends StatefulWidget {

  static const routeName = '/home';

  final TodoPresenter todoPresenter;

  TodoScreen(this.todoPresenter,{Key key, this.todo}) : super(key: key);

  final Todo todo;

  @override
  _TodoScreenState createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> implements TodoView{

  Future<List<Todo>> ftodos;
  List<Todo> todos = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    widget.todoPresenter.todoView = this;
    widget.todoPresenter.buildListView();

  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  void didUpdateWidget (StatefulWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    
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
              List<Todo> ts = todos.where((element) => element.checked).toList();
              widget.todoPresenter.deleteSelected(ts);
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
        onPressed: () =>  widget.todoPresenter.createClick(), 
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

  @override
  BuildContext getContext() {
    // TODO: implement getContext
    return context;
  }
}


