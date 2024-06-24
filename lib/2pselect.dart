import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'c2player.dart'; // Import the game
import '33c2player.dart';
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
      home: tpselect(),
    );
  }
}

class tpselect extends StatelessWidget {
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
              'Хэмжээгээ сонгон уу!',
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
                    MaterialPageRoute(builder: (context) => TicTacToe3x3()),
                  );}, // Handle your callback.
                  splashColor: Colors.brown.withOpacity(0.5),
                  child: Ink(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage('../assets/pictures/3x3.png'),
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
                    MaterialPageRoute(builder: (context) => TicTacToeGame()),
                  );}, // Handle your callback.
                  splashColor: Colors.brown.withOpacity(0.5),
                  child: Ink(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage('../assets/pictures/5x5.png'),
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