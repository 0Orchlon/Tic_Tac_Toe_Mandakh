import 'dart:io';
// import 'package:lottie/lottie.dart';
import 'package:flutter/material.dart';
// Import the game
import 'xoselect.dart';
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
                'XO3 Тавтай Морил!',
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
            children: [
                SizedBox(height: 20.0),
                Column(
                  children: [
                IconButton(  
                icon: Container(
                  width: 90.0,  // Width of the Image inside IconButton
                  height: 90.0, // Height of the Image inside IconButton
                  decoration: BoxDecoration(
                  color: Colors.white70, // Background color
                  borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: Image.asset('../assets/pictures/1player.png',
                  fit: BoxFit.cover, ),),
                iconSize: 50.0,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => xoselect())
                  );  
                },
                ),
              Text(
                      '1 Тоглогч',
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
            ]
            ),
              SizedBox(height: 20.0),
              Column(
                children: [
              IconButton(
                icon: Container(
                  width: 90.0,  // Width of the Image inside IconButton
                  height: 90.0, // Height of the Image inside IconButton
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                  color: Colors.white70, ),
                  child: Image.asset('../assets/pictures/2players.png' ,
                  fit: BoxFit.cover,),),
                iconSize: 50.0,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => tpselect())
                  );
                },
              ),
              Text(
                      '2 Тоглогч',
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
              ])
                  ],
              ),
            ]
          ),
          ),
        ),
    );
  }
} 