import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'c1playero.dart'; // Import the game
import 'c1playerx.dart';
// import 'package:lottie/lottie.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'XO Selection',
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
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('../assets/pictures/654321.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: 
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Дүрсээ сонгоно уу!',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ClipOval(
                  child: Material(
                  color: Colors.transparent, 
                  child: 
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
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage('../assets/pictures/xlocal.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                ),
                ),
                ClipOval(
                  child: Material(
                  color: Colors.transparent, 
                  child: 
                InkWell(
                  onTap: null, // Handle your callback.
                  splashColor: Colors.transparent,
                  child: Ink(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      ),
                    ),
                  ),
                ),
                ),
                ClipOval(
                  child: Material(
                  color: Colors.transparent, 
                  child: 
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
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage('../assets/pictures/olocal.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                ),
                )
              ],
            ),
          ],
        ),
    )
    );
  }
}