import 'package:flutter/material.dart';
import 'package:sat_basics_c14/ui/screens/calculator/calculator.dart';
import 'package:sat_basics_c14/ui/screens/game_board/game_board.dart';
import 'package:sat_basics_c14/ui/screens/game_board/xo_starter.dart';
import 'package:sat_basics_c14/ui/screens/home/home.dart';
import 'package:sat_basics_c14/ui/screens/login/login.dart';
import 'package:sat_basics_c14/ui/screens/register/register.dart';

///Containers Widget -> Row - Column - Stack
var blueDecoration =
    BoxDecoration(color: blue, borderRadius: BorderRadius.circular(16));
Color blue = Color(0xff024383);
TextStyle white700BoldStyle =
    TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16);

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
      routes: {
        Home.routeName: (_) => Home(),
        Login.routeName: (_) => Login(),
        Register.routeName: (_) => Register(),
        Calculator.routeName: (_) => Calculator(),
        GameBoard.routeName: (_) => GameBoard(),
        XoStarter.routeName: (_) => XoStarter(),
      },
      initialRoute: XoStarter.routeName,
    );
  }
}

///Stateful widgets - stateless widgets
