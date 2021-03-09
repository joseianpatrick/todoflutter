
import 'package:todoflutter/todo/backend/todo/repository/TodoDataSource.dart';
import 'package:todoflutter/todo/backend/todo/repository/source/network/TodoNetworkMapper.dart';
import 'package:todoflutter/todo/backend/todo/todo.dart';
import 'package:http/http.dart' as http; 
import 'dart:convert';

class TodoNetworkDataSource implements TodoDataSource{

  TodoNetworkMapper _todoNetworkMapper = new TodoNetworkMapper();

  @override
  Future<Todo> add(Todo todo) async {
      // TODO: implement add
        final response = await http.post(
          '192.168.1.2/api/todo/',
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: _todoNetworkMapper.mapToFrom(todo),
        );
        if (response.statusCode == 200) { 
            Todo todo = _todoNetworkMapper.mapFromTo(json.decode(response.body).cast<Map<String, dynamic>>());
            todo.id = todo.id; 
            return todo; 
        } else { 
            throw Exception('Unable to fetch products from the REST API'); 
        } 
    }
  
    @override
    Future<Todo> delete(Todo t) {
      // TODO: implement delete
      throw UnimplementedError();
    }
  
    @override
    Future<Todo> update(Todo t) {
    // TODO: implement update
    throw UnimplementedError();
  }

  @override
  Future<List<Todo>> getAll() async {
    // TODO: implement getAll
        final response = await http.get(
          'http://192.168.1.2/api/todo/',
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          }
        );

        if (response.statusCode == 200) { 
            // print(response.body);
            return _todoNetworkMapper.mapFromToList(response.body); 
        } else { 
            throw Exception('Unable to fetch products from the REST API'); 
        } 
  }


}