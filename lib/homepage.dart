import 'dart:io';
// import 'package:lottie/lottie.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'c2player.dart'; // Import the game
import 'xoselect.dart';
import '33c2player.dart';
import '2pselect.dart';
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
              Image.asset(
                '../assets/pictures/logo.png',  // Replace with your logo path
                width: 80,  // Adjust size as needed
                height: 80,
              ),
              Text(
                'Тик Так Той Тавтай Морил!',
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            
               SizedBox(height: 20.0),
               IconButton(
                icon: Image.asset('../assets/pictures/1player.png',
                  width: 70.0,  // Width of the Image inside IconButton
                  height: 70.0, // Height of the Image inside IconButton
                  fit: BoxFit.cover, ),
                iconSize: 50.0,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => xoselect())
                  );  
                },
              ),
              SizedBox(height: 20.0),
              IconButton(
                icon: Image.asset('../assets/pictures/2players.png' ,
                 width: 70.0,  // Width of the Image inside IconButton
                 height: 70.0, // Height of the Image inside IconButton
                    
                 fit: BoxFit.cover,),
                iconSize: 50.0,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => tpselect())
                  );
                },
              ),
             
            ],
          
        ),
      ),
    ));
  }
} 