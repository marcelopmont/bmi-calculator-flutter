import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/views/bottom_button.dart';
import 'package:bmi_calculator/views/reusable_card.dart';
import 'package:flutter/material.dart';

class ResultsPage extends StatelessWidget {
  ResultsPage(
      {@required this.resultBMI,
      @required this.resultTitle,
      @required this.resultDetails});

  final String resultTitle;
  final String resultBMI;
  final String resultDetails;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('RESULT'),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: Container(
                child: Text(
                  'Your Result',
                  style: kTitleTextStyle,
                ),
                alignment: Alignment.bottomLeft,
                margin: EdgeInsets.all(15.0),
              ),
              flex: 1,
            ),
            Expanded(
              flex: 6,
              child: ReusableCard(
                color: kCardBackgroundColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text(
                      resultTitle,
                      style: kResultTitleStyle,
                    ),
                    Text(
                      resultBMI,
                      style: kResultScoreStyle,
                    ),
                    Text(
                      resultDetails,
                      textAlign: TextAlign.center,
                      style: kResultDetailsStyle,
                    )
                  ],
                ),
              ),
            ),
            BottomButton(
              onTap: () {
                Navigator.pop(context);
              },
              buttonText: 'RE-CALCULATE',
            )
          ],
        ),
      ),
    );
  }
}
