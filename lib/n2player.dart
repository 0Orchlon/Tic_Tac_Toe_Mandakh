import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TicTacToeGame(),
    );
  }
}

class TicTacToeGame extends StatefulWidget {
  @override
  _TicTacToeGameState createState() => _TicTacToeGameState();
}
// check for the games state
class _TicTacToeGameState extends State<TicTacToeGame> {
  List<List<String>> board = List.generate(3, (_) => List.filled(3, ''));
  String currentPlayer = 'X';
  @override
  void initState() {
    super.initState();
    initializeGame();
  }
// start the game
  void initializeGame() {
    board = List.generate(3, (_) => List.filled(3, ''));
    currentPlayer = 'X';
  }
// Cell press
  void onCellTapped(int row, int col) {
    if (board[row][col].isEmpty) {
      setState(() {
        board[row][col] = currentPlayer;
        if (checkWin()) {
          showWinDialog();
        } else if (checkDraw()) {
          showDrawDialog();
        } else {
          currentPlayer = currentPlayer == 'X'? 'O' : 'X';
        }
      });
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
// Check for draw
  bool checkDraw() {
    for (int i = 0; i < 3; i++) {
      for (int j = 0; j < 3; j++) {
        if (board[i][j].isEmpty) {
          return false;
        }
      }
    }
    return true;
  }
// Show Win
  void showWinDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Game Over'),
          content: Text('Player $currentPlayer wins!'),
          actions: <Widget>[
            ElevatedButton(
              child: Text('Play Again'),
              onPressed: () {
                initializeGame();
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
// Draw display
  void showDrawDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Game Over'),
          content: Text('It\'s a draw!'),
          actions: <Widget>[
            ElevatedButton(
              child: Text('Play Again'),
              onPressed: () {
                initializeGame();
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
// The main interface
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tic Tac Toe Mandkah'),
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
        ),
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
        },
      ),
    );
  }
}