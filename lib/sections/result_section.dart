import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tip_calculator_app/constants.dart';

class ResultSection extends StatefulWidget {
  double bill;
  double tip;
  int numberOfPeople;

  ResultSection(
      {super.key,
      required this.bill,
      required this.tip,
      required this.numberOfPeople});

  @override
  State<ResultSection> createState() => _ResultSectionState();
}

class _ResultSectionState extends State<ResultSection> {
  double tipAmount() {
    return widget.bill * widget.tip / 100 / widget.numberOfPeople;
  }

  double total() {
    print(
        "Bill: ${widget.bill}, Tip: ${widget.tip}, Number of people: ${widget.numberOfPeople} ");
    return widget.bill / widget.numberOfPeople + tipAmount();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(14),
      width: double.infinity,
      decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(5),
          color: kColorTile),
      child: Column(
        children: [
          Row(
            children: [
              const Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Tip Amount",
                      style: TextStyle(
                        fontSize: 24,
                        color: kColorWhite,
                      ),
                    ),
                    Text(
                      "/ person",
                      style: TextStyle(fontSize: 20, color: kColorInputText),
                    )
                  ],
                ),
              ),
              Expanded(
                child: Text(
                  "\$${tipAmount()}",
                  textAlign: TextAlign.end,
                  style: TextStyle(fontSize: 42, color: kColorSalad),
                ),
              )
            ],
          ),
          const SizedBox(
            height: 14,
          ),
          Row(
            children: [
              const Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Total",
                      style: TextStyle(
                        fontSize: 24,
                        color: kColorWhite,
                      ),
                    ),
                    Text(
                      "/ person",
                      style: TextStyle(fontSize: 20, color: kColorInputText),
                    )
                  ],
                ),
              ),
              Expanded(
                child: Text(
                  "\$${total()}",
                  textAlign: TextAlign.end,
                  style: TextStyle(fontSize: 42, color: kColorSalad),
                ),
              )
            ],
          ),
          // ListTile(
          //   contentPadding: EdgeInsets.zero,
          //   leading: const SingleChildScrollView(
          //     child: Column(
          //       crossAxisAlignment: CrossAxisAlignment.start,
          //       children: [
          //         Text(
          //           "Total",
          //           style: TextStyle(
          //             fontSize: 24,
          //             color: kColorWhite,
          //           ),
          //         ),
          //   Text(
          //     "/ person",
          //     style: TextStyle(fontSize: 20, color: kColorInputText),
          //   )
          // ],
          // ),
          //   ),
          //   trailing: Text(
          //     "\$${total()}",
          //     style: TextStyle(fontSize: 42, color: kColorSalad),
          //   ),
          // ),
          const SizedBox(
            height: 20,
          ),
          // Container(
          //   alignment: Alignment.center,
          //   padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          //   width: double.infinity,
          //   decoration: BoxDecoration(
          //       shape: BoxShape.rectangle,
          //       borderRadius: BorderRadius.circular(5),
          //       color: kColorSalad),
          //   child: const Text(
          //     "RESET",
          //     style: TextStyle(
          //         color: kColorTile,
          //         fontSize: 28,
          //         fontWeight: FontWeight.bold,
          //         letterSpacing: 2.5),
          //   ),
          // )
        ],
      ),
    );
  }
}
