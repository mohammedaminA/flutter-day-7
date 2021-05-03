import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'reusable_card.dart';
import 'package:bmi_calculator/IconContent.dart';
import 'constants.dart';
import 'results_page.dart';
import 'package:bmi_calculator/RoundIconButton.dart';
import 'package:bmi_calculator/BottomButton.dart';
import 'calculator_brain.dart';

enum GenderType {
  female,
  male,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  double _currentSliderValue = 120;
  int weight = 40;
  GenderType selectedGender;
  int age = 16;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('BMI CALCULATOR'),
        ),
        body: Column(
          children: <Widget>[
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: ReusableCard(
                      onPress: () {
                        setState(() {
                          selectedGender = GenderType.male;
                        });
                      },
                      colour: selectedGender == GenderType.male
                          ? kActiveCardColor
                          : kInactiveCardColor,
                      childCard: GenderChildCard(
                          text: 'MALE', icon: FontAwesomeIcons.mars),
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(
                      onPress: () {
                        setState(() {
                          selectedGender = GenderType.female;
                        });
                      },
                      colour: selectedGender == GenderType.female
                          ? kActiveCardColor
                          : kInactiveCardColor,
                      childCard: GenderChildCard(
                          text: 'FEMALE', icon: FontAwesomeIcons.venus),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ReusableCard(
                childCard: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'HEIGHT',
                      style: kTextStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: <Widget>[
                        Text(
                          _currentSliderValue.round().toString(),
                          style: kNumberStyle,
                        ),
                        Text(
                          'cm',
                          style: kTextStyle,
                        )
                      ],
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        thumbShape:
                            RoundSliderThumbShape(enabledThumbRadius: 15.0),
                        thumbColor: Color(0XFFEB1555),
                        overlayColor: Color(0X29EB1555),
                        activeTrackColor: Colors.white,
                        inactiveTrackColor: Color(0XFF8D8E98),
                        overlayShape:
                            RoundSliderOverlayShape(overlayRadius: 30.0),
                      ),
                      child: Slider(
                          value: _currentSliderValue,
                          inactiveColor: Color(0XFF9193A5),
                          min: 120.0,
                          max: 250,
                          onChanged: (double value) {
                            setState(() {
                              _currentSliderValue = value;
                            });
                          }),
                    )
                  ],
                ),
                colour: kActiveCardColor,
              ),
            ),
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: ReusableCard(
                        colour: kActiveCardColor,
                        childCard: buildColumn('WEIGHT', weight)),
                  ),
                  Expanded(
                    child: ReusableCard(
                      colour: kActiveCardColor,
                      childCard: buildColumn('AGE', age),
                    ),
                  )
                ],
              ),
            ),
            BottomButton(
              text: 'CALCULATE',
              onPress: () {
                CalculatorBrain calc = CalculatorBrain(height: _currentSliderValue, weight: weight);


                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ResultsPage(
                      bmiResult: calc.calculateBMI(),
                      resultText: calc.getResult(),
                      interpretation: calc.getInterpretation(),
                    ),
                  ),
                );
              },
            ),
          ],
        ));
  }

  Column buildColumn(String text, int dynamicText) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          text,
          style: kTextStyle,
        ),
        Text(
          dynamicText.toString(),
          style: kNumberStyle,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RoundIconButton(
                icon: FontAwesomeIcons.minus,
                ontap: () {
                  setState(() {
                    dynamicText == age ? age-- : weight--;
                  });
                }),
            SizedBox(
              width: 10,
            ),
            RoundIconButton(
                icon: FontAwesomeIcons.plus,
                ontap: () {
                  setState(() {
                    dynamicText == age ? age++ : weight++;
                  });
                })
          ],
        )
      ],
    );
  }
}



