import 'dart:async';

import 'package:flutter/material.dart';
import 'package:sat_basics_c14/ui/utils/int_extensions.dart';

class TimerWidget extends StatefulWidget {
  const TimerWidget({super.key});

  @override
  State<TimerWidget> createState() => TimerWidgetState();
}

class TimerWidgetState extends State<TimerWidget> {
  late Timer _timer;
  int secondsCounter = 0;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        secondsCounter = timer.tick;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return buildTimer();
  }

  Widget buildTimer() {
    int seconds = secondsCounter;
    int hours = seconds ~/ (60 * 60);
    seconds = seconds - hours * 3600;
    int minutes = seconds ~/ 60;
    seconds -= minutes * 60;

    return Container(
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(44)),
      margin: EdgeInsets.symmetric(vertical: 24, horizontal: 16),
      padding: EdgeInsets.symmetric(
        vertical: 18,
      ),
      child: Text(
        "${hours.formattedTime}:${minutes.formattedTime}:${seconds.formattedTime}",
        textAlign: TextAlign.center,
        style: TextStyle(
            color: Colors.black, fontSize: 32, fontWeight: FontWeight.w600),
      ),
    );
  }

  resetTimer() {
    _timer.cancel();
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        secondsCounter = timer.tick;
      });
    });
  }
}
