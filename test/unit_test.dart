import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:http/http.dart' as http;
class MockitoTest extends Mock implements http.Client {}

void main(){
  test('returns a Map if there is no error', () async {
        http.Client mockitoExample = MockitoTest();
        
        when(mockitoExample.get('http://192.168.1.2/api/todo/'))
            .thenAnswer((value) async {
              return http.Response('{"id": 1,"title": "title test","description": "description test"}', 200);
        });

        expect(await fetchFromDatabase(mockitoExample), isA<Map>());
    });
  }
    
Future fetchFromDatabase(http.Client client) async {
  final response =
  await client.get('http://192.168.1.2/api/todo/');

  if (response.statusCode == 200) {
    return jsonDecode(response.body);
  } else {
    throw Exception('exception occured!!!!!!');
  }
}