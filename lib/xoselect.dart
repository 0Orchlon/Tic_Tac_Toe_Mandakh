import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'c1playero.dart'; // Import the game
import 'c1playerx.dart';
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
      home: xoselect(),
    );
  }
}

class xoselect extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tic Tac Toe Mandkah'),
      ),
      body: 
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Choose your shape!',
              style: TextStyle(
                color: Colors.blue,
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => TicTacToeGame1()),
                  );}, // Handle your callback.
                  splashColor: Colors.brown.withOpacity(0.5),
                  child: Ink(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('../assets/pictures/xlocal.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 20), // Add some space between the two images
                InkWell(
                  onTap: () {Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => TicTacToeGame2()),
                  );}, // Handle your callback.
                  splashColor: Colors.brown.withOpacity(0.5),
                  child: Ink(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('../assets/pictures/olocal.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
    );
  }
}