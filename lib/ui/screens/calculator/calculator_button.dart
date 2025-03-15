import 'package:flutter/material.dart';
import 'package:sat_basics_c14/ui/screens/calculator/calculator.dart';

class CalculatorButton extends StatelessWidget {
  final String text;
  final Color textColor;
  final Color backgroundColor;
  final Function onClick;

  const CalculatorButton(
      {super.key,
      required this.text,
      required this.backgroundColor,
      required this.textColor,
      required this.onClick});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(4),
      child: ElevatedButton(
          onPressed: () {
            onClick(text);
          },
          style: ButtonStyle(
              minimumSize: WidgetStatePropertyAll(
                  Size(double.infinity, double.infinity)),
              shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20))),
              backgroundColor: WidgetStatePropertyAll(backgroundColor)),
          child: Text(
            text,
            style: digitStyle.copyWith(color: textColor),
          )),
    );
  }
}
