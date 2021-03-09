import 'package:flutter/material.dart';
import 'package:todoflutter/core/backend/todo/todo.dart';

mixin TodoView {
  void setListView(List<Todo> todos);
  // FutureBuilder fbuilder(){}
  void addItem(Todo todo);
  BuildContext getContext();
}