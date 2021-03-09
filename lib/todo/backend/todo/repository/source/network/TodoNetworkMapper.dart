
import 'package:todoflutter/core/data/Mapper.dart';

import '../../../todo.dart';
import 'dart:convert';
class TodoNetworkMapper implements Mapper<String,Todo>{
  @override
  Todo mapFromTo(String f) {
      // TODO: implement mapFromTo

    Map<String, dynamic> json = jsonDecode(f);
    Todo todo = new Todo();
    todo.title = json['title'];
    todo.description = json['description'];
    return todo;
  }

  List<Todo> mapFromToList(String listResponse) {
    // TODO: implement mapFromToList
       final parsed = json.decode(listResponse).cast<Map<String, dynamic>>(); 
      return parsed.map<Todo>((json) => Todo.fromMap(json)).toList();
  }

  @override
  String mapToFrom(Todo t) {
    // TODO: implement mapToFrom
     throw UnimplementedError();
  }

  List<Map> mapToFromList(String listResponse) {
  // TODO: implement mapToFromList
  throw UnimplementedError();
  }
 

}