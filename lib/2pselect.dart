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
      body:Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('../assets/pictures/654321.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
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
            SizedBox(height: 20), // Adds some space between the title and the images
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    ClipRect(
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => TicTacToe3x3()),
                            );
                          },
                          splashColor: Colors.brown.withOpacity(0.5),
                          child: Ink(
                            height: 100,
                            width: 100,
                            decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                image: AssetImage('../assets/pictures/3x3.png'),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      '3x3 grid',
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ],
                ),
                SizedBox(width: 20), // Adds space between the columns
                Column(
                  children: [
                    ClipRect(
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          onTap: null,
                          splashColor: Colors.transparent,
                          child: Ink(
                            height: 100,
                            width: 100,
                            decoration: BoxDecoration(),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      '',
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ],
                ),
                SizedBox(width: 20), // Adds space between the columns
                Column(
                  children: [
                    ClipRect(
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => TicTacToeGame()),
                            );
                          },
                          splashColor: Colors.brown.withOpacity(0.5),
                          child: Ink(
                            height: 100,
                            width: 100,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage('../assets/pictures/5x5.png'),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      '6x6 grid 5x5 rule',
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}