import 'package:flutter/material.dart';
import 'package:tip_calculator_app/constants.dart';

class PercentTile extends StatefulWidget {
  // double percentOverall;
  double percentTile;
  int tileNumber;
  List tileList;
  TileCallback onTapCallback;

  PercentTile(
      {super.key,
      // required this.percentOverall,
      required this.percentTile,
      required this.tileNumber,
      required this.tileList,
      required this.onTapCallback});

  @override
  State<PercentTile> createState() => _PercentTileState();
}

class _PercentTileState extends State<PercentTile> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.onTapCallback(widget.tileNumber, widget.percentTile);
      },
      child: Container(
        decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            color:
                widget.tileList[widget.tileNumber] ? kColorSalad : kColorTile,
            borderRadius: BorderRadius.circular(5)),
        alignment: Alignment.center,
        child: Text(
          "${widget.percentTile}%",
          style: TextStyle(
              fontSize: 32,
              color: widget.tileList[widget.tileNumber]
                  ? kColorWhite
                  : kColorSalad),
        ),
      ),
    );
  }
}
