import 'package:flutter/material.dart';
import 'c2player.dart'; // Import the game

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tic Tac Toe Mandkah'),
      ),
      body: Center(
        child: ElevatedButton(
          child: Text('Play'),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => TicTacToeGame()),
            );
          },
        ),
      ),
    );
  }
}
