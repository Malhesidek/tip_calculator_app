import 'package:flutter/material.dart';
import 'package:tip_calculator_app/constants.dart';

class TipTitle extends StatelessWidget {
  const TipTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(margin: const EdgeInsets.symmetric(vertical: 50),
      child: const Center(
          child: Text(
        'SPLI\nTTER',
        style: TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.bold,
            color: kColorTitle,
            height: 0.8,
            letterSpacing: 10),
      )),
    );
  }
}
