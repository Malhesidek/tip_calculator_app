import 'package:flutter/material.dart';
import 'package:tip_calculator_app/constants.dart';
import 'package:tip_calculator_app/widgets/input_percent_tile.dart';
import 'package:tip_calculator_app/widgets/percent_tile.dart';

class PercentSection extends StatefulWidget {
  String title;
  // double percent;
  void Function(String, String) onChangeCustom;
  void Function(double) callBackPercent;

  PercentSection(
      {super.key,
      required this.title,
      required this.onChangeCustom,
      required this.callBackPercent});

  @override
  State<PercentSection> createState() => _PercentSectionState();
}

class _PercentSectionState extends State<PercentSection> {
  List activeTiles = [true, false, false, false, false, false];

  void setActiveTile(index, percentTile) {
    setState(() {
      activeTiles = List.filled(6, false);
      activeTiles[index] = true;
      widget.callBackPercent(percentTile);
      print(percentTile);
      print(activeTiles);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.title,
          textAlign: TextAlign.start,
          style: const TextStyle(color: kColorInputText, fontSize: 24),
        ),
        Row(
          children: [
            Expanded(
                flex: 7,
                child: PercentTile(
                  // percentOverall: widget.percent,
                  percentTile: 5,
                  tileNumber: 0,
                  tileList: activeTiles,
                  onTapCallback: setActiveTile,
                )),
            Expanded(flex: 1, child: SizedBox()),
            Expanded(
                flex: 7,
                child: PercentTile(
                    percentTile: 10,
                    tileNumber: 1,
                    tileList: activeTiles,
                    onTapCallback: setActiveTile)),
          ],
        ),
        SizedBox(
          height: 20,
        ),
        Row(
          children: [
            Expanded(
                flex: 7,
                child: PercentTile(
                  // percentOverall: widget.percent,
                  percentTile: 15,
                  tileNumber: 2,
                  tileList: activeTiles,
                  onTapCallback: setActiveTile,
                )),
            Expanded(flex: 1, child: SizedBox()),
            Expanded(
                flex: 7,
                child: PercentTile(
                    // percentOverall: widget.percent,
                    percentTile: 20,
                    tileNumber: 3,
                    tileList: activeTiles,
                    onTapCallback: setActiveTile)),
          ],
        ),
        SizedBox(
          height: 20,
        ),
        Row(
          children: [
            Expanded(
                flex: 7,
                child: PercentTile(
                  // percentOverall: widget.percent,
                  percentTile: 25,
                  tileNumber: 4,
                  tileList: activeTiles,
                  onTapCallback: setActiveTile,
                )),
            Expanded(flex: 1, child: SizedBox()),
            Expanded(
                flex: 7,
                child: InputPercentTile(
                  tileNumber: 5,
                  onTapCallback: setActiveTile,
                  onChange: widget.onChangeCustom,
                )),
          ],
        ),
      ],
    );
  }
}
