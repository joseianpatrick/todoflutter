import 'package:flutter/material.dart';
import 'todolist.dart';
import 'backend/todo/todo.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

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
              todos.add(new Todo.defConst(title:_todoTitleController.text,description:_todoDescriptionController.text));
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
            }, 
            child: Text(
              'Delete',
              style: TextStyle(color: Colors.red),
              )
          )
        ],
        title: Text('Delete Todo'),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
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
        onPressed: () => _showFormAddTodoDialog(context),
        tooltip: 'Create To Do',
        child: Icon(Icons.add),
      ), 
    );
  }
  
}


