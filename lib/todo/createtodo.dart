import 'package:flutter/material.dart';
import 'package:todoflutter/todo/presenter/TodoCreatePresenter.dart';
import 'package:todoflutter/todo/view/TodoCreateView.dart';

class CreateTodo extends StatefulWidget {

  static const routeName = '/createtodo';

  final TodoCreatePresenter todoCreatePresenter;

  CreateTodo({this.todoCreatePresenter,Key key}): super(key:key);

  @override
  _CreateTodoState createState() => _CreateTodoState();
}

class _CreateTodoState extends State<CreateTodo> implements TodoCreateView{
  
  var _todoTitleController = TextEditingController();
  var _todoDescriptionController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    widget.todoCreatePresenter.todoCreateView = this;
  }
  

  @override
  Widget build(BuildContext context) {
    widget.todoCreatePresenter.getArgs();
  //  final Todo args = ModalRoute.of(context).settings.arguments;
  //   if(args!=null){
  //     _todoTitleController.text = args.title ;
  //     _todoDescriptionController.text = args.description ;
  //   }
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
                          widget.todoCreatePresenter.saveClick();
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

  @override
  String getDescription() {
    // TODO: implement getDescription
    return _todoDescriptionController.text;
  }

  @override
  String getTitle() {
    // TODO: implement getTitle
    return _todoTitleController.text;
  }

  @override
  void setDescription(String description) {
      // TODO: implement setDescription
    _todoDescriptionController.text = description;
  }

  @override
  void setTitle(String title) {
    // TODO: implement setTitle
    _todoTitleController.text = title;
  }

  @override
  BuildContext getContext() {
    // TODO: implement getContext
    return context;
  }
}