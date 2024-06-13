import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'c2player.dart'; // Import the game
import 'xoselect.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
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
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Welcome to Tic Tac Toe!',
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () {
                  // Navigate to the game screen
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => xoselect()),
    
                  );
                },
                child: Text('Start Game', style: TextStyle(color: Colors.white),),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  shape: BeveledRectangleBorder(
                 borderRadius: BorderRadius.circular(20), // Rounded corners
                    ),
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30), // Button padding
                ),
              ),
              SizedBox(height: 10.0),
              ElevatedButton(
                onPressed: () {
                  // Navigate to the game screen
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => TicTacToeGame()),
                  );
                },
                child: Text('Start 2 player Game', style: TextStyle(color: Colors.white),),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  shape: BeveledRectangleBorder(
                 borderRadius: BorderRadius.circular(20), // Rounded corners
                    ),
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30), // Button padding
                ),
              ),
              SizedBox(height: 10.0),
              ElevatedButton(
                onPressed: () {
                  
                  SystemNavigator.pop();
                },
                child: Text('exit', style: TextStyle(color: Colors.white),),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey,
                  shape: BeveledRectangleBorder(
                 borderRadius: BorderRadius.circular(20), // Rounded corners
                    ),
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30), // Button padding
                ),
              ),
            ],
          // hlep me
        ),
      ),
    );
  }
} 