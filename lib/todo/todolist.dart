import 'package:flutter/material.dart';
import 'backend/todo/todo.dart';
class TodoList extends StatefulWidget{
  
  final List<Todo> todos;


  TodoList({Key key, this.todos}): super(key:key);


  @override
  _TodoListState createState() => _TodoListState();
}

class _TodoListState extends State<TodoList>{
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        padding: const EdgeInsets.all(8),
        itemCount: widget.todos.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
              child: ListTile(
              leading: Checkbox(
                value: widget.todos[index].checked,
                onChanged: (bool value){
                  setState(() {
                    widget.todos[index].checked = value;
                  });
                },
              ),
              title: Text(widget.todos[index].title),
              subtitle: Text(widget.todos[index].description),
            )
          );
        },
      separatorBuilder: (BuildContext context, int index) => const Divider(),
    );
  }
}