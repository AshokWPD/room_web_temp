import 'dart:async';

import 'package:flutter/material.dart';

class CountDownText extends StatefulWidget {
  const CountDownText({super.key});

  @override
  _CountDownTextState createState() => _CountDownTextState();
}

class _CountDownTextState extends State<CountDownText> {
  int count = 1;

  @override
  void initState() {
    super.initState();
    startCountdown();
  }

  void startCountdown() {
    const oneSecond = Duration(microseconds: 1);
    Timer.periodic(oneSecond, (timer) {
      if (count < 300) {
        setState(() {
          count++;
        });
      } else {
        timer.cancel(); // Stop the countdown when it reaches 1
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      '$count',
      style: const TextStyle(
        color: Colors.redAccent,
        fontSize: 18,
      ),
    );
  }
}
