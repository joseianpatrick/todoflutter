import 'package:flutter/material.dart';
import 'package:todoflutter/todo/createtodo.dart';
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
    return ListView.builder(
        padding: const EdgeInsets.fromLTRB(4,12,4,12),
        itemCount: widget.todos.length,
        itemBuilder: (BuildContext context, int index) {
        return Card(
            elevation: 2,
            child: ClipPath(
              //rounded corner 
              clipper: ShapeBorderClipper(shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(3))
                        ),
              child: Container(
              //border color
              decoration: BoxDecoration(
              border: Border(left: BorderSide(color: Colors.blueAccent, width: 4))),
              child: ListTile(
                    title: Text(widget.todos[index].title),
                    subtitle: Text(widget.todos[index].description),
                    leading: Checkbox(
                      value: widget.todos[index].checked,
                      onChanged: (bool value){
                        setState(() {
                          widget.todos[index].checked = value;
                        });
                    },
                  ),
                  onTap: () => _buttonTapped(index),
                ),
              ),
            ),
          );
        },
    );
  }
    Future _buttonTapped(int index) async {
      final dataFromSecondPage = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => new CreateTodo(todo:widget.todos[index]))) as Todo;
  
    if (dataFromSecondPage != null) {
       final todo = widget.todos.firstWhere((element) => element.id == index);

      setState(() {
        todo.title = dataFromSecondPage.title;
        todo.description = dataFromSecondPage.description;
      });
    }
  }
}