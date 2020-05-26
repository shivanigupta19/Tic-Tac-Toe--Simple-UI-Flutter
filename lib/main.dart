import 'package:flutter/material.dart';
import 'package:tic_tac_toe/HomePage.dart';

void main()
{
  runApp(MaterialApp(
    title: 'Tic Tac Toe',
    debugShowCheckedModeBanner: false,
    home: MyApp()
    ));
} 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tic Tac Toe',style: TextStyle(
          color: Colors.white,
        ),),
        backgroundColor: Colors.black,
        ),
        backgroundColor: Colors.blueGrey,
        body: new HomePage(),
      );
      
  }
}
