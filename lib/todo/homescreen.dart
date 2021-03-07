import 'package:flutter/material.dart';
import 'todolist.dart';
import 'backend/todo/todo.dart';
import 'createtodo.dart';
import 'dart:async' show Future;

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.todo}) : super(key: key);


  final Todo todo;


  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  final List<Todo> todos = [];


  final List<int> colorCodes = <int>[500,600,100,200];
  
  var _todoTitleController = TextEditingController();
  var _todoDescriptionController = TextEditingController();

  _showFormAddTodoDialog(BuildContext context){
    _todoTitleController.clear();
    _todoDescriptionController.clear();

    return showDialog(context: context,barrierDismissible: true,builder: (param){
      return AlertDialog(
        actions: <Widget>[
          FlatButton(
            onPressed: () => Navigator.pop(context), 
            child: Text(
              'Cancel',
              style: TextStyle(color: Colors.red),
              )
            ),
          FlatButton(
            onPressed: () {
              Todo todo = new Todo(title: _todoTitleController.text,description: _todoDescriptionController.text);
              todos.add(todo);
              //redraw stateful widget
              setState(() {}); 
            }, 
            child: Text('Save')
          )
        ],
        title: Text('Add Todo'),
        content: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              TextField(
                decoration: InputDecoration(
                  hintText: "Title",
                  labelText: "Todo Title"
                ),
                controller: _todoTitleController,
              ),
              TextField(
                decoration: InputDecoration(
                  hintText: "Description",
                  labelText: "Todo Description"
                ),
                controller: _todoDescriptionController,
              ),
            ],
          ),
        )
      );
    });
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
      body:TodoList(todos: todos),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Create To Do',
        child: Icon(Icons.add),
      //   onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder:(context) => CreateTodo()
        
      //   ),
      // ),
      onPressed: () =>  _buttonTapped(), 
      )
    );
  }

  //in android this is like startactivityfor result
  Future _buttonTapped() async {
      final dataFromSecondPage = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => new CreateTodo())) as Todo;
  
    if (dataFromSecondPage != null) {
      setState(() {
        todos.add(new Todo(title: dataFromSecondPage.title,description: dataFromSecondPage.description,id: (todos.length)));
      });
    }
  }
}


