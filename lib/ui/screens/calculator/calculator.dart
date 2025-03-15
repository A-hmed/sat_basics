import 'package:flutter/material.dart';
import 'package:sat_basics_c14/ui/screens/calculator/calculator_button.dart';

Color calculatorBackground = Color(0xff17181A);
Color lightBlue = Color(0xff29A8FF);
Color darkBlue = Color(0xff005DB2);
Color grey = Color(0xff616161);
Color lightBlack = Color(0xff303136);

TextStyle digitStyle =
    TextStyle(fontWeight: FontWeight.w700, fontSize: 30, color: Colors.white);
TextStyle resultStyle =
    TextStyle(fontWeight: FontWeight.w500, fontSize: 48, color: lightBlue);

class Calculator extends StatefulWidget {
  static String routeName = "calculator";

  @override
  State createState() {
    return _CalculatorState();
  }
}

class _CalculatorState extends State {
  String result = "";

  String lhs = "";
  String savedOperator = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: calculatorBackground,
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: Column(
                children: [
                  Text("history"),
                  Text(
                    result,
                    textAlign: TextAlign.end,
                    style: resultStyle,
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                firstSetOfButtons(),
                secondSetOfButtons(),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget firstSetOfButtons() => Expanded(
          child: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: CalculatorButton(
                      text: "Ac",
                      backgroundColor: grey,
                      textColor: Colors.white,
                      onClick: onOperatorClick),
                ),
                Expanded(
                  child: CalculatorButton(
                      text: "Del",
                      backgroundColor: grey,
                      textColor: Colors.white,
                      onClick: onOperatorClick),
                )
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: CalculatorButton(
                      text: "7",
                      backgroundColor: grey,
                      textColor: Colors.white,
                      onClick: onDigitClick),
                ),
                Expanded(
                  child: CalculatorButton(
                      text: "8",
                      backgroundColor: grey,
                      textColor: Colors.white,
                      onClick: onDigitClick),
                )
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: CalculatorButton(
                      text: "4",
                      backgroundColor: grey,
                      textColor: Colors.white,
                      onClick: onDigitClick),
                ),
                Expanded(
                  child: CalculatorButton(
                      text: "5",
                      backgroundColor: grey,
                      textColor: Colors.white,
                      onClick: onDigitClick),
                )
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: CalculatorButton(
                      text: "1",
                      backgroundColor: grey,
                      textColor: Colors.white,
                      onClick: onDigitClick),
                ),
                Expanded(
                  child: CalculatorButton(
                      text: "2",
                      backgroundColor: grey,
                      textColor: Colors.white,
                      onClick: onDigitClick),
                )
              ],
            ),
          ),
          Expanded(
            child: CalculatorButton(
                text: "0",
                backgroundColor: grey,
                textColor: Colors.white,
                onClick: onDigitClick),
          ),
        ],
      ));

  Widget secondSetOfButtons() => Expanded(
          child: Row(
        children: [
          thirdColumn(),
          fourthColumn(),
        ],
      ));

  Expanded thirdColumn() {
    return Expanded(
        child: Column(
      children: [
        Expanded(
          child: CalculatorButton(
              text: "/",
              backgroundColor: grey,
              textColor: Colors.white,
              onClick: onOperatorClick),
        ),
        Expanded(
          child: CalculatorButton(
              text: "9",
              backgroundColor: grey,
              textColor: Colors.white,
              onClick: onDigitClick),
        ),
        Expanded(
          child: CalculatorButton(
              text: "6",
              backgroundColor: grey,
              textColor: Colors.white,
              onClick: onDigitClick),
        ),
        Expanded(
          child: CalculatorButton(
              text: "3",
              backgroundColor: grey,
              textColor: Colors.white,
              onClick: onDigitClick),
        ),
        Expanded(
          child: CalculatorButton(
              text: ".",
              backgroundColor: grey,
              textColor: Colors.white,
              onClick: onDigitClick),
        ),
      ],
    ));
  }

  Expanded fourthColumn() {
    return Expanded(
        child: Column(
      children: [
        Expanded(
          child: CalculatorButton(
              text: "*",
              backgroundColor: grey,
              textColor: Colors.white,
              onClick: onOperatorClick),
        ),
        Expanded(
          child: CalculatorButton(
              text: "-",
              backgroundColor: grey,
              textColor: Colors.white,
              onClick: onOperatorClick),
        ),
        Expanded(
          child: CalculatorButton(
              text: "+",
              backgroundColor: grey,
              textColor: Colors.white,
              onClick: onOperatorClick),
        ),
        Expanded(
          child: CalculatorButton(
              text: "=",
              backgroundColor: grey,
              textColor: Colors.white,
              onClick: onEqualClick),
        ),
      ],
    ));
  }

  void onEqualClick(_) {
    result = calculate(lhs, savedOperator, result);
    savedOperator = "";
    lhs = "";
    setState(() {});
  }

  void onOperatorClick(String clickedOperator) {
    if (clickedOperator == '-') {
      //todo: fix me for negative numbers
    }
    if (savedOperator.isEmpty) {
      lhs = result;
    } else {
      if (lhs.isEmpty || result.isEmpty) return;
      lhs = calculate(lhs, savedOperator, result);
    }
    savedOperator = clickedOperator;
    result = "";
    setState(() {});
    print("lhs = $lhs, saved operator = $savedOperator");
  }

  String calculate(String lhs, String operator, String rhs) {
    double n1 = double.parse(lhs);
    double n2 = double.parse(rhs);

    if (operator == "+") {
      return "${n1 + n2}";
    } else if (operator == "-") {
      return "${n1 - n2}";
    } else if (operator == "*") {
      return "${n1 * n2}";
    } else {
      return "${n1 / n2}";
    }
  }

  void onDigitClick(String digit) {
    if (result.contains('.') && digit == '.') return;
    result += digit;
    setState(() {});
  }
}
