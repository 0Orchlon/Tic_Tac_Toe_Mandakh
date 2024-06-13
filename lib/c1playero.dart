import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TicTacToeGame2(),
    );
  }
}

class TicTacToeGame2 extends StatefulWidget {
  @override
  _TicTacToeGame2State createState() => _TicTacToeGame2State();
}

class _TicTacToeGame2State extends State<TicTacToeGame2> {
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
      makeBotMove();
    });
  }
// place shape
void onCellTapped(int row, int col) {
  if (board[row][col].isEmpty) {
    setState(() {
      board[row][col] = 'O';
      moveCount++;
      if (moveHistory.length >= 6) {
        removeFirstMove();
      }
      moveHistory.add([row, col]);
      if (checkWin()) {
        oWins++;
        showWinDialog();
      } else {
        currentPlayer = 'X';
        makeBotMove(); // Call makeBotMove here
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
    barrierDismissible: false, // Prevent dialog from being dismissed when clicking outside
    builder: (context) {
      return AlertDialog(
        title: AbsorbPointer(child: Center(child: Text('Player $currentPlayer wins!'))),
        actions: <Widget>[
          Center(
            child: ElevatedButton(
              child: Text('Play Again'),
              onPressed: () {
                initializeGame();
                Navigator.of(context).pop();
              },
            ),
          ),
        ],
      );
    },
  );
}
// Evaluate the game state
int evaluateGameState() {
  // Check for win conditions
  for (int i = 0; i < 3; i++) {
    if (board[i][0] == board[i][1] && board[i][0] == board[i][2] && board[i][0] != '') {
      return board[i][0] == 'X' ? -1 : 1;
    }
    if (board[0][i] == board[1][i] && board[0][i] == board[2][i] && board[0][i] != '') {
      return board[0][i] == 'X' ? -1 : 1;
    }
  }
  if (board[0][0] == board[1][1] && board[0][0] == board[2][2] && board[0][0] != '') {
    return board[0][0] == 'X' ? -1 : 1;
  }
  if (board[0][2] == board[1][1] && board[0][2] == board[2][0] && board[0][2] != '') {
    return board[0][2] == 'X' ? -1 : 1;
  }
  // If no one has won, return 0
  return 0;
}
// Check if the player can win in the next move
bool canPlayerWin(int row, int col) {
  // Check for win conditions
  for (int i = 0; i < 3; i++) {
    if (board[i][0] == 'X' && board[i][1] == 'X' && board[i][2] == '') {
      return true;
    }
    if (board[0][i] == 'X' && board[1][i] == 'X' && board[2][i] == '') {
      return true;
    }
  }
  if (board[0][0] == 'X' && board[1][1] == 'X' && board[2][2] == '') {
    return true;
  }
  if (board[0][2] == 'X' && board[1][1] == 'X' && board[2][0] == '') {
    return true;
  }
  return false;
}
// Minimax algorithm
int minimax(int depth, bool isMaximizing) {
  int score = evaluateGameState();
  if (score!= 0) {
    return score;
  }
  if (isMaximizing) {
    int bestScore = -1000;
    for (int i = 0; i < 3; i++) {
      for (int j = 0; j < 3; j++) {
        if (board[i][j] == '') {
          board[i][j] = 'O';
          int score = minimax(depth + 1, false);
          board[i][j] = '';
          bestScore = max(bestScore, score);
          // Check if the player can win in the next move
          if (canPlayerWin(i, j)) {
            // Block the player's move if possible
            bestScore = -1000;
          }
        }
      }
    }
    return bestScore;
  } else {
    int bestScore = 1000;
    for (int i = 0; i < 3; i++) {
      for (int j = 0; j < 3; j++) {
        if (board[i][j] == '') {
          board[i][j] = 'X';
          int score = minimax(depth + 1, true);
          board[i][j] = '';
          bestScore = min(bestScore, score);
        }
      }
    }
    return bestScore;
  }
}

void makeBotMove() {
  if (moveCount == 0) {
    // Make a random move for the bot's first move
    int row = Random().nextInt(3);
    int col = Random().nextInt(3);
    while (board[row][col]!= '') {
      row = Random().nextInt(3);
      col = Random().nextInt(3);
    }
    setState(() {
      board[row][col] = 'X';
      moveCount++;
      if (moveHistory.length >= 6) {
        removeFirstMove();
      }
      moveHistory.add([row, col]);
      if (checkWin()) {
        xWins++;
        showWinDialog();
      } else {
        currentPlayer = 'O';
      }
    });
  } else {
    // Check if the bot can win in the next move
    bool canWin = false;
    int winRow = -1;
    int winCol = -1;
    for (int i = 0; i < 3; i++) {
      for (int j = 0; j < 3; j++) {
        if (board[i][j] == '') {
          board[i][j] = 'X';
          if (checkWin()) {
            canWin = true;
            winRow = i;
            winCol = j;
          }
          board[i][j] = '';
        }
      }
    }
    if (canWin) {
      // Make the winning move
      setState(() {
        board[winRow][winCol] = 'X';
        moveCount++;
        if (moveHistory.length >= 6) {
          removeFirstMove();
        }
        moveHistory.add([winRow, winCol]);
        if (checkWin()) {
          xWins++;
          showWinDialog();
        } else {
          currentPlayer = 'O';
        }
      });
    } else {
      // Check if the player can win in the next move
      bool canBlock = false;
      int blockRow = -1;
      int blockCol = -1;
      for (int i = 0; i < 3; i++) {
        for (int j = 0; j < 3; j++) {
          if (board[i][j] == '') {
            board[i][j] = 'O';
            if (checkWin()) {
              canBlock = true;
              blockRow = i;
              blockCol = j;
            }
            board[i][j] = '';
          }
        }
      }
      if (canBlock) {
        // Block the player's winning move
        setState(() {
          board[blockRow][blockCol] = 'X';
          moveCount++;
          if (moveHistory.length >= 6) {
            removeFirstMove();
          }
          moveHistory.add([blockRow, blockCol]);
          if (checkWin()) {
            xWins++;
            showWinDialog();
          } else {
            currentPlayer = 'O';
          }
        });
      } else {
        // Make a random move
        int row = Random().nextInt(3);
        int col = Random().nextInt(3);
        while (board[row][col]!= '') {
          row = Random().nextInt(3);
          col = Random().nextInt(3);
        }
        setState(() {
          board[row][col] = 'X';
          moveCount++;
          if (moveHistory.length >= 6) {
            removeFirstMove();
          }
          moveHistory.add([row, col]);
          if (checkWin()) {
            xWins++;
            showWinDialog();
          } else {
            currentPlayer = 'O';
          }
        });
      }
    }
  }
}
// The Interface
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bot O3'),
      ),
      body:  Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('../assets/pictures/background.gif'),
          fit: BoxFit.cover,
        ),
      ),
      child: 
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          children: [
          // Text('Current Turn: ${currentPlayer == 'X'? 'X' : 'O'}', style: TextStyle(fontSize: 24),),
            Container(
            decoration: currentPlayer == 'X'
                ? BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(width: 4, color: Colors.green))
                : null,
              child: Image.asset('../assets/pictures/xlocal.png', width: 30, height: 30, fit: BoxFit.contain),
            ),
            Text('Wins: $xWins', style: TextStyle(fontSize: 24, color: Colors.white),),
          ],
        ),
        SizedBox(width: 20), // Add some space between the two columns
        Column(
          children: [
            Container(
              decoration: currentPlayer == 'O'
                ? BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(width: 4, color: Colors.green))
                : null,
              child: Image.asset('../assets/pictures/olocal.png', width: 30, height: 30, fit: BoxFit.contain),
            ),
            Text('Wins: $oWins', style: TextStyle(fontSize: 24, color: Colors.white),),
          ],
        ),
      ],
    ),
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
          color: Colors.grey[200], // Change the background color
          border: Border.all(),
        ),
        child: Center(
          child: board[row][col].isEmpty
    ? Text('')
    : board[row][col] == 'X'
      ? SizedBox(
          width: 60,
          height: 60,
          child: Image.asset('../assets/pictures/xlocal.png', fit: BoxFit.contain),
        )
      : SizedBox(
          width: 60,
          height: 60,
          child: Image.asset('../assets/pictures/olocal.png', fit: BoxFit.contain),
        ),
)
      ),
    );
  },
)
        ),)
        ],),
    )
    );
  }
}