import 'package:flutter/material.dart';
import 'package:sat_basics_c14/ui/screens/game_board/game_board.dart';

class XoButton extends StatelessWidget {
  final String symbol;
  final Function onClick;
  final int index;

  const XoButton(
      {super.key,
      required this.symbol,
      required this.onClick,
      required this.index});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: TextButton(
            onPressed: () {
              onClick(index);
            },
            child: Text(
              symbol,
              style: symbol == "o" ? oStyle : xStyle,
            )));
  }
}
////