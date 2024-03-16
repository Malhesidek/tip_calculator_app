import 'package:flutter/material.dart';
import 'package:tip_calculator_app/constants.dart';

class InputPercentTile extends StatefulWidget {
  int tileNumber;
  void Function(String, String) onChange;
  TileCallback onTapCallback;

  InputPercentTile(
      {super.key,
      required this.tileNumber,
      required this.onChange,
      required this.onTapCallback});

  @override
  State<InputPercentTile> createState() => _InputPercentTileState();
}

class _InputPercentTileState extends State<InputPercentTile> {
  FocusNode _focusNode = FocusNode();
  String _hintText = "CUSTOM";
  double _percentValue = 0;

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      _hintText = _focusNode.hasFocus ? '' : "CUSTOM";
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (valueTextField) {
        setState(() {
          _percentValue = valueTextField.isNotEmpty ? double.parse(valueTextField) : 0;
          widget.onChange('Select Tip %', valueTextField);
        });
      },
      onTap: () {
        setState(() {
          widget.onTapCallback(widget.tileNumber, _percentValue);
        });
      },
      focusNode: _focusNode,
      style: const TextStyle(fontSize: 24, color: kColorTile),
      textAlign: TextAlign.center,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        hintText: _hintText,
        contentPadding: const EdgeInsets.symmetric(horizontal: 10),
        border: const OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.all(
            Radius.circular(5),
          ),
        ),
        fillColor: Colors.grey.shade200,
        filled: true,
      ),
    );
  }
}
