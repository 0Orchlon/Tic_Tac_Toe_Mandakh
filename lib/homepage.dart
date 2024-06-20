import 'dart:io';
// import 'package:lottie/lottie.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'c2player.dart'; // Import the game
import 'xoselect.dart';
import '33c2player.dart';
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
        scaffoldBackgroundColor: Colors.white,
      ),
      home: HomePage(),
    );
  }
}
void closeAppUsingSystemPop(){
  exit(0);
}
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tic Tac Toe Mandkah'),
      ),
      body: Container(
      decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('../assets/pictures/654321.jpg'),
            fit: BoxFit.cover,
          ),
        ),
      child: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Тик Так Той Тавтай Морил!',
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
                child: Text('Эхлэх', style: TextStyle(color: Colors.white),),
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
                    MaterialPageRoute(builder: (context) => TicTacToe3x3()),
                  );
                },
                child: Text('2 Тоглогч 3x3', style: TextStyle(color: Colors.white),),
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
                  // Navigate to the game screen
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => TicTacToeGame()),
                  );
                },
                child: Text('2 Тоглогч 6x6', style: TextStyle(color: Colors.white),),
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
                  closeAppUsingSystemPop();
                },
                child: Text('Гарах', style: TextStyle(color: Colors.white),),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.redAccent,
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
    ));
  }
} 