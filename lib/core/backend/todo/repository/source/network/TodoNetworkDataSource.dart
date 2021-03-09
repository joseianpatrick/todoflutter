
import 'package:http/http.dart' as http; 
import 'dart:convert';

import '../../../todo.dart';
import '../../TodoDataSource.dart';
import 'TodoNetworkMapper.dart';

class TodoNetworkDataSource implements TodoDataSource{

  TodoNetworkMapper _todoNetworkMapper = new TodoNetworkMapper();

  @override
  Future<Todo> add(Todo todo) async {
      // TODO: implement add
        final response = await http.post(
          'http://192.168.1.2/api/todo/',
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: _todoNetworkMapper.mapToFrom(todo),
        );
        if (response.statusCode == 201) { 
            Todo todo = _todoNetworkMapper.mapFromTo(response.body);
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
  Future<Todo> update(Todo t) async{
    // TODO: implement update

    final response = await http.put(
        'http://192.168.1.2/api/todo/'+t.id.toString(),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: _todoNetworkMapper.mapToFrom(t),
      );
      if (response.statusCode == 200) { 
          Todo todo = _todoNetworkMapper.mapFromTo(response.body);
          return todo; 
      } else { 
          throw Exception('Unable to fetch products from the REST API'); 
      } 
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

  @override
  Future deleteAll(List<String> todos) async {
    // TODO: implement deleteAll
     final response = await http.post(
        'http://192.168.1.2/api/todo/massDelete',
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(todos),
      );

      if (response.statusCode == 200) { 
          return 'Successfully Deleted'; 
      } else { 
          throw Exception('Unable to fetch products from the REST API'); 
      } 
  }
}