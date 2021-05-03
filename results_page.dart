import 'package:bmi_calculator/reusable_card.dart';
import 'package:flutter/material.dart';
import 'constants.dart';
import 'BottomButton.dart';
import 'input_page.dart';
import 'package:bmi_calculator/RoundIconButton.dart';

class ResultsPage extends StatelessWidget {
  ResultsPage({@required this.bmiResult, @required this.interpretation, @required this.resultText});

  final String bmiResult;
  final String resultText;
  final String interpretation;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('BMI Calculator'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: Container(
                padding: EdgeInsets.all(15.0),
                alignment: Alignment.bottomLeft,
                child: Text('Your Result', style: kTitleTextStyle),
              ),
            ),
            Expanded(
              flex: 5,
              child: ReusableCard(
                colour: kActiveCardColor,
                childCard: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget> [
                    Text(
                      resultText,
                      style: kResultTextStyle,
                    ),
                    Text (
                      bmiResult,
                      style: kBmiTextStyle,
                    ),
                    Text (
                      interpretation,
                      style: kBodyTextStyle,
                      textAlign: TextAlign.center
                    )
                  ],
                ),
              ),
            ),
            BottomButton(text: 'RE-CALCULATE', onPress: () {
              Navigator.pop(context);
            })
          ],
        ));
  }
}
