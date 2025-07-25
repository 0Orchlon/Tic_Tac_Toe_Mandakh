import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

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
  List<List<String>> board = List.generate(7, (_) => List.filled(7, ''));
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

  void initializeGame() {
    setState(() {
      board = List.generate(7, (_) => List.filled(7, ''));
      currentPlayer = 'X';
      moveCount = 0;
      moveHistory.clear();
    });
  }

  void onCellTapped(int row, int col) {
    if (board[row][col].isEmpty) {
      setState(() {
        board[row][col] = currentPlayer;
        moveCount++;
        if (moveHistory.length >= 10) {
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
          currentPlayer = currentPlayer == 'X' ? 'O' : 'X';
        }
      });
    }
  }

  void removeFirstMove() {
    if (moveHistory.isNotEmpty) {
      int row = moveHistory.first[0];
      int col = moveHistory.first[1];
      board[row][col] = '';
      moveHistory.removeAt(0);
      moveCount--;
    }
  }

  bool checkWin() {
    // Check rows
    for (int i = 0; i < 7; i++) {
      for (int j = 0; j < 3; j++) {
        if (board[i][j] != '' &&
            board[i][j] == board[i][j + 1] &&
            board[i][j] == board[i][j + 2] &&
            board[i][j] == board[i][j + 3] &&
            board[i][j] == board[i][j + 4]) {
          return true;
        }
      }
    }

    // Check columns
    for (int i = 0; i < 3; i++) {
      for (int j = 0; j < 7; j++) {
        if (board[i][j] != '' &&
            board[i][j] == board[i + 1][j] &&
            board[i][j] == board[i + 2][j] &&
            board[i][j] == board[i + 3][j] &&
            board[i][j] == board[i + 4][j]) {
          return true;
        }
      }
    }

    // Check diagonals (top-left to bottom-right)
    for (int i = 0; i < 3; i++) {
      for (int j = 0; j < 3; j++) {
        if (board[i][j] != '' &&
            board[i][j] == board[i + 1][j + 1] &&
            board[i][j] == board[i + 2][j + 2] &&
            board[i][j] == board[i + 3][j + 3] &&
            board[i][j] == board[i + 4][j + 4]) {
          return true;
        }
      }
    }

    // Check diagonals (bottom-left to top-right)
    for (int i = 6; i >= 5; i--) {
      for (int j = 0; j < 3; j++) {
        if (board[i][j] != '' &&
            board[i][j] == board[i - 1][j + 1] &&
            board[i][j] == board[i - 2][j + 2] &&
            board[i][j] == board[i - 3][j + 3] &&
            board[i][j] == board[i - 4][j + 4]) {
          return true;
        }
      }
    }

    return false;
  }

  void showWinDialog() {
    showDialog(
      context: context,
      barrierDismissible: false, // Prevent dialog from being dismissed when clicking outside
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.transparent,
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Left Lottie Animation
                  Lottie.asset(
                    'assets/lottie/congrats.json',
                    width: 100,
                    height: 100,
                  ),
                  SizedBox(width: 10), // Spacing between Lottie and text
                  AbsorbPointer(
                    child: Center(
                      child: Text(
                        'Player $currentPlayer wins!',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  SizedBox(width: 10), // Spacing between text and Lottie
                  // Right Lottie Animation
                  Lottie.asset(
                    'assets/lottie/congrats.json',
                    width: 100,
                    height: 100,
                  ),
                ],
              ),
              SizedBox(height: 20), // Spacing between text and button
              ElevatedButton(
                child: Text(
                  'Play Again',
                  style: TextStyle(color: Colors.black),
                ),
                onPressed: () {
                  initializeGame();
                  Navigator.of(context).pop();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  shape: BeveledRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('2 Player XO3'),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('../assets/pictures/3545420.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Container(
                      padding: EdgeInsets.only(bottom: 10), // Add padding to move the text
                      child: Column(
                        children: [
                          Container(
                            decoration: currentPlayer == 'X'
                                ? BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(width: 3, color: Colors.green),
                                  )
                                : null,
                            child: Opacity(
                              opacity: currentPlayer == 'X' ? 1.0 : 0.3,
                              child: Image.asset(
                                '../assets/pictures/xlocal.png',
                                width: 50,
                                height: 50,
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                          SizedBox(height: 10), // Add some space between image and text
                          Text(
                            'Wins: $xWins',
                            style: TextStyle(fontSize: 24, color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(width: 25), // Add some space between the two columns
                Column(
                  children: [
                    Container(
                      padding: EdgeInsets.only(bottom: 10), // Add padding to move the text
                      child: Column(
                        children: [
                          Container(
                            decoration: currentPlayer == 'O'
                                ? BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(width: 3, color: Colors.green),
                                  )
                                : null,
                            child: Opacity(
                              opacity: currentPlayer == 'O' ? 1.0 : 0.3,
                              child: Image.asset(
                                '../assets/pictures/olocal.png',
                                width: 50,
                                height: 50,
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                          SizedBox(height: 10), // Add some space between image and text
                          Text(
                            'Wins: $oWins',
                            style: TextStyle(fontSize: 24, color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 10), // Add space between the rows and the grid
            Center(
              child: SizedBox(
                width: 300, // Adjust the width and height as needed
                height: 300,
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 7,
                  ),
                  itemCount: 49,
                  itemBuilder: (context, index) {
                    final row = index ~/ 7;
                    final col = index % 7;
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
                                      child: Image.asset('../assets/pictures/xlocal.png',
                                        fit: BoxFit.contain,
                                      ),
                                    )
                                  : SizedBox(
                                      width: 60,
                                      height: 60,
                                      child: Image.asset('../assets/pictures/olocal.png',
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
