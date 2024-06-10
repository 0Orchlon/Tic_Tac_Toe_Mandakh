import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TicTacToeGame1(),
    );
  }
}

class TicTacToeGame1 extends StatefulWidget {
  @override
  _TicTacToeGame1State createState() => _TicTacToeGame1State();
}

class _TicTacToeGame1State extends State<TicTacToeGame1> {
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
// The Interface
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('1 Player XO3'),
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
                  border: Border.all(width: 9, color: Colors.green))
                : null,
              child: Image.asset('../assets/pictures/xlocal.png', width: 30, height: 30, fit: BoxFit.contain),
            ),
            Text('Wins: $xWins', style: TextStyle(fontSize: 24),),
          ],
        ),
        SizedBox(width: 20), // Add some space between the two columns
        Column(
          children: [
            Container(
              decoration: currentPlayer == 'O'
                ? BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(width: 9, color: Colors.green))
                : null,
              child: Image.asset('../assets/pictures/olocal.png', width: 30, height: 30, fit: BoxFit.contain),
            ),
            Text('Wins: $oWins', style: TextStyle(fontSize: 24),),
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