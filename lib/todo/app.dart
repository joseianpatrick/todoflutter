import 'package:flutter/material.dart';
import 'homescreen.dart';

class App extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.white
      ),
      home: MyHomePage(title: "TODO list"),
    );
  }
}