import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tip_calculator_app/constants.dart';
import 'package:tip_calculator_app/sections/input_section.dart';
import 'package:tip_calculator_app/sections/percent_section.dart';
import 'package:tip_calculator_app/sections/result_section.dart';
import 'package:tip_calculator_app/sections/tip_container.dart';
import 'package:tip_calculator_app/title.dart';

double checkStringValue(String value2) {
  if (value2.isNotEmpty) {
    return double.parse(value2);
  } else {
    return 0;
  }
}

void main() {
  runApp(TipCalculator());
}

class TipCalculator extends StatefulWidget {
  const TipCalculator({super.key});

  @override
  State<TipCalculator> createState() => _TipCalculatorState();
}

class _TipCalculatorState extends State<TipCalculator> {
  double bill = 1;
  double tipPercent = 5;
  int numberOfPeople = 1;

  void changeValue(String argumentType, String newValue) {
    setState(() {
      if (argumentType == 'Bill') {
      bill = checkStringValue(newValue);
    } else if (argumentType == 'Select Tip %') {
      tipPercent = checkStringValue(newValue);
    } else if (argumentType == 'Number of people') {
      numberOfPeople = checkStringValue(newValue).toInt();
    }
    });
  }

  void callBackPercent(double value) {
    setState(() {
      tipPercent = value;  
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light().copyWith(
        scaffoldBackgroundColor: kColorBackground,
        textTheme: GoogleFonts.tekoTextTheme(),
      ),
      home: SafeArea(
        child: Scaffold(
          body: Column(
            children: [
              const TipTitle(),
              Expanded(
                child: SingleChildScrollView(
                  child: TipContainer(widgets: [
                    InputSection(
                      title: "Bill",
                      icon: SvgPicture.asset(
                        "assets/images/icon-dollar.svg",
                        height: 24,
                      ),
                      number: this.bill,
                      onChange: changeValue,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    PercentSection(
                      title: "Select Tip %",
                      // percent: percent,
                      onChangeCustom: changeValue,
                      callBackPercent: callBackPercent,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    InputSection(
                        title: "Number of people",
                        icon: SvgPicture.asset(
                          'assets/images/icon-person.svg',
                          height: 24,
                        ),
                        number: this.numberOfPeople,
                        onChange: changeValue),
                    const SizedBox(
                      height: 20,
                    ),
                    ResultSection(
                        bill: bill,
                        tip: tipPercent,
                        numberOfPeople: numberOfPeople),
                  ]),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
