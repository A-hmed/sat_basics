import 'package:flutter/material.dart';
import 'package:sat_basics_c14/ui/screens/game_board/timer_widget.dart';
import 'package:sat_basics_c14/ui/screens/game_board/xo_button.dart';

TextStyle xStyle = TextStyle(
    fontSize: 50, color: Color(0xffF54D62), fontWeight: FontWeight.w700);
TextStyle oStyle = xStyle.copyWith(color: Color(0xff87E43A));

class GameBoard extends StatefulWidget {
  static const routeName = "game_board";

  const GameBoard({super.key});

  @override
  State<GameBoard> createState() => _GameBoardState();
}

class _GameBoardState extends State<GameBoard> {
  @override
  void initState() {
    super.initState();
  }

  int secondsCounter = 0;
  int playCounter = 0;
  List<String> board = ["", "", "", "", "", "", "", "", ""];
  int player1Score = 0;
  int player2Score = 0;
  GlobalKey<TimerWidgetState> timerKey = GlobalKey();
  late String starterSymbol;

  @override
  Widget build(BuildContext context) {
    starterSymbol = ModalRoute.of(context)!.settings.arguments as String;
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [Color(0xff00D2FF), Color(0xff3A7BD5)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TimerWidget(
                key: timerKey,
              ),
              buildPlayersScore(),
              buildBoard(),
            ],
          ),
        ),
      ),
    );
  }

  buildPlayersScore() => Text(
        "Player1: $player1Score \nPlayer2: $player2Score",
        textAlign: TextAlign.center,
        style: TextStyle(
            color: Colors.white, fontWeight: FontWeight.w700, fontSize: 28),
      );

  buildBoard() => Expanded(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(44),
          ),
          child: Stack(
            children: [
              Column(
                children: [
                  Expanded(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        XoButton(
                          symbol: board[0],
                          onClick: onPlayerTurn,
                          index: 0,
                        ),
                        XoButton(
                          symbol: board[1],
                          onClick: onPlayerTurn,
                          index: 1,
                        ),
                        XoButton(
                          symbol: board[2],
                          onClick: onPlayerTurn,
                          index: 2,
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        XoButton(
                          symbol: board[3],
                          onClick: onPlayerTurn,
                          index: 3,
                        ),
                        XoButton(
                          symbol: board[4],
                          onClick: onPlayerTurn,
                          index: 4,
                        ),
                        XoButton(
                          symbol: board[5],
                          onClick: onPlayerTurn,
                          index: 5,
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        XoButton(
                          symbol: board[6],
                          onClick: onPlayerTurn,
                          index: 6,
                        ),
                        XoButton(
                          symbol: board[7],
                          onClick: onPlayerTurn,
                          index: 7,
                        ),
                        XoButton(
                          symbol: board[8],
                          onClick: onPlayerTurn,
                          index: 8,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  VerticalDivider(
                    thickness: 1.5,
                    color: Colors.black,
                    indent: 22,
                    endIndent: 22,
                  ),
                  VerticalDivider(
                    thickness: 1,
                    color: Colors.black,
                    indent: 22,
                    endIndent: 22,
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Divider(
                    thickness: 1.5,
                    color: Colors.black,
                    indent: 22,
                    endIndent: 22,
                  ),
                  Divider(
                    thickness: 1,
                    color: Colors.black,
                    indent: 22,
                    endIndent: 22,
                  ),
                ],
              )
            ],
          ),
        ),
      );

  void onPlayerTurn(int index) {
    if (board[index].isNotEmpty) return;
    board[index] = symbol;

    if (checkWinner()) {
      if (symbol == "o")
        player1Score++;
      else
        player2Score++;
      resetBoard();
      return;
    }
    if (playCounter == 8) {
      resetBoard();
      return;
    }

    playCounter++;
    setState(() {});
  }

  bool checkWinner() {
    // if(board[0].isNotEmpty && board[0] == board[1] && board[1] == board[2]){
    //   return true;
    // }
    ///Rows
    if (board[0] == symbol && board[1] == symbol && board[2] == symbol) {
      return true;
    }
    if (board[3] == symbol && board[4] == symbol && board[5] == symbol) {
      return true;
    }
    if (board[6] == symbol && board[7] == symbol && board[8] == symbol) {
      return true;
    }

    ///Columns
    if (board[0] == symbol && board[3] == symbol && board[6] == symbol) {
      return true;
    }
    if (board[1] == symbol && board[4] == symbol && board[7] == symbol) {
      return true;
    }
    if (board[2] == symbol && board[5] == symbol && board[8] == symbol) {
      return true;
    }

    ///Diagonals
    if (board[0] == symbol && board[4] == symbol && board[8] == symbol) {
      return true;
    }
    if (board[2] == symbol && board[4] == symbol && board[6] == symbol) {
      return true;
    }
    return false;
  }

  resetBoard() {
    board = ["", "", "", "", "", "", "", "", ""];
    secondsCounter = 0;
    playCounter = 0;
    timerKey.currentState!.resetTimer();
    setState(() {});
  }

  String get symbol => playCounter % 2 == 0
      ? starterSymbol
      : starterSymbol == "x"
          ? "o"
          : "x";
}
