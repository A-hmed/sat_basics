import 'package:flutter/material.dart';
import 'package:sat_basics_c14/ui/screens/game_board/game_board.dart';

class XoStarter extends StatelessWidget {
  static const routeName = "xo_starter";

  const XoStarter({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            image:
                DecorationImage(image: AssetImage("assets/xo_background.png"))),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                "Pick who goes first?",
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
              Row(
                children: [
                  SizedBox(
                    width: 16,
                  ),
                  buildSymbolBox(context, "x"),
                  SizedBox(
                    width: 16,
                  ),
                  buildSymbolBox(context, "o"),
                  SizedBox(
                    width: 16,
                  ),
                ],
              )
            ],
          ),
        ));
  }

  buildSymbolBox(BuildContext context, String symbol) {
    return Expanded(
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, GameBoard.routeName, arguments: symbol);
        },
        child: Container(
            margin: EdgeInsets.symmetric(vertical: 26),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(32)),
            child: Text(
              symbol,
              style: symbol == "x"
                  ? xStyle.copyWith(fontSize: 90)
                  : oStyle.copyWith(fontSize: 90),
              textAlign: TextAlign.center,
            )),
      ),
    );
  }
}
