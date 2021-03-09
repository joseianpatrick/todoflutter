
// import 'package:flutter/src/widgets/basic.dart';
// import 'dart:async' show Future;
import 'package:todoflutter/todo/backend/todo/todo.dart';

mixin TodoView {
  void setListView(List<Todo> todos);
  // FutureBuilder fbuilder(){}
  void addItem(Todo todo);
}