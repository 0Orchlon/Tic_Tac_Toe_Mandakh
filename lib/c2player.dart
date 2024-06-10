import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TicTacToeGame(),
    );
  }
}

class TicTacToeGame extends StatefulWidget {
  @override
  _TicTacToeGameState createState() => _TicTacToeGameState();
}

class _TicTacToeGameState extends State<TicTacToeGame> {
  List<List<String>> board = List.generate(3, (_) => List.filled(3, ''));
  String currentPlayer = 'X';
  int moveCount = 0;
  List<List<int>> moveHistory = [];
  int xWins = 0;
  int oWins = 0;

  @override
  void initState() {
    super.initState();
    initializeGame();
  }
// start the game
  void initializeGame() {
    setState(() {
      board = List.generate(3, (_) => List.filled(3, ''));
      currentPlayer = 'X';
      moveCount = 0;
      moveHistory.clear();
    });
  }
// place shape
  void onCellTapped(int row, int col) {
  if (board[row][col].isEmpty) {
    setState(() {
      board[row][col] = currentPlayer;
      moveCount++;
      if (moveHistory.length >= 6) {
        removeFirstMove();
      }
      moveHistory.add([row, col]);
      if (checkWin()) {
        if (currentPlayer == 'X') {
            xWins++;
          } else {
            oWins++;
          }
        showWinDialog();
      } else {
        currentPlayer = currentPlayer == 'X'? 'O' : 'X';
      }
    });
  }
}
// Remove the first shape
  void removeFirstMove() {
  if (moveHistory.isNotEmpty) {
    int row = moveHistory.first[0];
    int col = moveHistory.first[1];
    board[row][col] = '';
    moveHistory.removeAt(0);
    moveCount--;
  }
}
// Check for win
  bool checkWin() {
    for (int i = 0; i < 3; i++) {
      if (board[i][0]!= '' && board[i][0] == board[i][1] && board[i][0] == board[i][2]) {
        return true;
      }
      if (board[0][i]!= '' && board[0][i] == board[1][i] && board[0][i] == board[2][i]) {
        return true;
      }
    }
    if (board[0][0]!= '' && board[0][0] == board[1][1] && board[0][0] == board[2][2]) {
      return true;
    }
    if (board[0][2]!= '' && board[0][2] == board[1][1] && board[0][2] == board[2][0]) {
      return true;
    }
    return false;
  }
// Win Dialog
  void showWinDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Center(child:  Text('Player $currentPlayer wins!'),),
          actions: <Widget>[
            Center(child:
            ElevatedButton(
              child: Text('Play Again'),
              onPressed: () {
                initializeGame();
                Navigator.of(context).pop();
              },
            )),
          ],
        );
      },
    );
  }
// The Interface
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('2 Player XO3'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [ Text('X Wins: $xWins, O Wins: $oWins', style: TextStyle(fontSize: 24)),
          SizedBox(height: 20),
      Center(child: SizedBox(
        width: 300, // Adjust the width and height as needed
        height: 300,
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,),
        itemCount: 9,
        itemBuilder: (context, index) {
          final row = index ~/ 3;
          final col = index % 3;
          return GestureDetector(
            onTap: () => onCellTapped(row, col),
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(),
              ),
              child: Center(
                child: Text(
                  board[row][col],
                  style: TextStyle(fontSize: 48),
                ),
              ),
            ),
          );
        },)
        ),)
        ],
      ),
    );
  }
}