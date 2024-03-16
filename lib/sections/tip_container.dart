import 'package:flutter/material.dart';
import 'package:tip_calculator_app/constants.dart';

class TipContainer extends StatefulWidget {
  List<Widget> widgets;

  TipContainer({super.key, required this.widgets});

  @override
  State<TipContainer> createState() => _TipContainerState();
}

class _TipContainerState extends State<TipContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20), topRight: Radius.circular(20)),
        color: kColorWhite,
      ),
      padding: const EdgeInsets.all(50),
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        // mainAxisSize: MainAxisSize.min,
        children: widget.widgets,
      ),
    );
  }
}
