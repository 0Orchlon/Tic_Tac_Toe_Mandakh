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
      home: TicTacToe3x3(),
    );
  }
}

class TicTacToe3x3 extends StatefulWidget {
  @override
  _TicTacToe3x3State createState() => _TicTacToe3x3State();
}

class _TicTacToe3x3State extends State<TicTacToe3x3> {
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

  void initializeGame() {
    setState(() {
      board = List.generate(3, (_) => List.filled(3, ''));
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
    for (int i = 0; i < 3; i++) {
      if (board[i][0] != '' && board[i][0] == board[i][1] && board[i][0] == board[i][2]) {
        return true;
      }
      if (board[0][i] != '' && board[0][i] == board[1][i] && board[0][i] == board[2][i]) {
        return true;
      }
    }
    if (board[0][0] != '' && board[0][0] == board[1][1] && board[0][0] == board[2][2]) {
      return true;
    }
    if (board[0][2] != '' && board[0][2] == board[1][1] && board[0][2] == board[2][0]) {
      return true;
    }
    return false;
  }

  void showWinDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.transparent,
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Lottie.asset(
                    '../assets/lottie/congrats.json',
                    width: 100,
                    height: 100,
                  ),
                  SizedBox(width: 10),
                  AbsorbPointer(
                    child: Center(
                      child: Text(
                        'Player $currentPlayer wins!',
                        style: TextStyle(color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  Lottie.asset(
                    '../assets/lottie/congrats.json',
                    width: 100,
                    height: 100,
                  ),
                ],
              ),
              SizedBox(height: 20),
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
                      decoration: currentPlayer == 'X'
                          ? BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(width: 9, color: Colors.green),
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
                    Text(
                      'Wins: $xWins',
                      style: TextStyle(fontSize: 24, color: Colors.white),
                    ),
                  ],
                ),
                SizedBox(width: 20),
                Column(
                  children: [
                    Container(
                      decoration: currentPlayer == 'O'
                          ? BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(width: 9, color: Colors.green),
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
                    Text(
                      'Wins: $oWins',
                      style: TextStyle(fontSize: 24, color: Colors.white),
                    ),
                  ],
                ),
              ],
            ),
            Center(
              child: SizedBox(
                width: 300,
                height: 300,
                child: GridView.builder(
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
                          color: Colors.grey[200],
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
