import 'package:flutter/material.dart';
import 'package:tip_calculator_app/constants.dart';

class InputSection extends StatefulWidget {
  String title;
  var icon;
  num number;
  void Function(String, String) onChange;

  InputSection(
      {super.key,
      required this.title,
      required this.icon,
      required this.number,
      required this.onChange});

  @override
  State<InputSection> createState() => _InputSectionState();
}

class _InputSectionState extends State<InputSection> {
  FocusNode _focusNode = FocusNode();
  String _hintText = "1";

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      if (_focusNode.hasFocus) {
        _hintText = '';
      } else {
        _hintText = '1';
      }
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.title,
          textAlign: TextAlign.start,
          style: const TextStyle(color: kColorInputText, fontSize: 24),
        ),
        TextField(
          onChanged: (valueTextField) {
            setState(() {
              widget.onChange(widget.title, valueTextField);
            });
          },
          focusNode: _focusNode,
          keyboardType: TextInputType.number,
          style: const TextStyle(fontSize: 36, color: kColorTile),
          textAlign: TextAlign.end,
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
              prefixIcon:
                  Container(margin: EdgeInsets.all(20), child: widget.icon),
              prefixIconConstraints: BoxConstraints(
                maxHeight: 100,
              )),
        )
      ],
    );
  }
}
