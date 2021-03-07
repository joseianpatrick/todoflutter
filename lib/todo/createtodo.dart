import 'package:flutter/material.dart';
import 'backend/todo/todo.dart';

class CreateTodo extends StatefulWidget {

  final Todo todo;

  CreateTodo({Key key,this.todo}): super(key:key);

  @override
  _CreateTodoState createState() => _CreateTodoState();
}

class _CreateTodoState extends State<CreateTodo> {
  

  var _todoTitleController = TextEditingController();
  var _todoDescriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    if(widget.todo!=null){
      _todoTitleController.text = widget.todo.title ;
      _todoDescriptionController.text = widget.todo.description ;
    }
    return Scaffold(
      appBar: AppBar(
        title: Text("Todo"),
      ),
      body:SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: <Widget>[
                TextField(
                  decoration: InputDecoration(
                    hintText: "Title",
                  ),
                  controller: _todoTitleController,
                ),
                TextField(
                  decoration: InputDecoration(
                    hintText: "Description",
                  ),
                  controller: _todoDescriptionController,
                  maxLines: 12,
                ),
                ConstrainedBox(
                    constraints: const BoxConstraints(minWidth: double.infinity),
                    child: 
                      ElevatedButton(
                        onPressed: () {
                          Todo todo = new Todo(title: _todoTitleController.text,description: _todoDescriptionController.text);
                          // Navigator.of(context).pop({'selection':todo});
                          Navigator.pop(context,todo);
                          print('test button save');
                        }, 
                        child: Text('Save')
                    ),
                )
              ],
            ),
          ),
        ),
      );
  }
}