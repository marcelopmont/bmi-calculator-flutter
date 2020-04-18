import 'package:bmi_calculator/calculator_brain.dart';
import 'package:bmi_calculator/views/bottom_button.dart';
import 'package:bmi_calculator/views/reusable_card.dart';
import 'package:bmi_calculator/views/rounded_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:bmi_calculator/views/genre_selection.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi_calculator/constants.dart';

enum Genre { Male, Female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  int height = 180;
  int weight = 70;
  int age = 25;

  Color maleBackgroundColor = kInactiveCardBackgroundColor;
  Color femaleBackgroundColor = kInactiveCardBackgroundColor;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('BMI CALCULATOR'),
        ),
        body: Container(
          child: Column(
            children: <Widget>[
              Expanded(
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: GestureDetector(
                        child: ReusableCard(
                          color: maleBackgroundColor,
                          cardChild: GenreSelection(
                            icon: FontAwesomeIcons.mars,
                            description: 'Male',
                          ),
                        ),
                        onTap: () => selectGenre(Genre.Male),
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        child: ReusableCard(
                          color: femaleBackgroundColor,
                          cardChild: GenreSelection(
                            icon: FontAwesomeIcons.venus,
                            description: 'Female',
                          ),
                        ),
                        onTap: () => selectGenre(Genre.Female),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: ReusableCard(
                        color: kCardBackgroundColor,
                        cardChild: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              'HEIGHT',
                              style: kSimpleTextStyle,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.baseline,
                              textBaseline: TextBaseline.alphabetic,
                              children: <Widget>[
                                Text(
                                  height.toString(),
                                  style: kInputTextStyle,
                                ),
                                Text(
                                  'cm',
                                  style: kSimpleTextStyle,
                                ),
                              ],
                            ),
                            SliderTheme(
                              data: SliderTheme.of(context).copyWith(
                                activeTrackColor: Colors.white,
                                inactiveTrackColor: Colors.white,
                                thumbColor: kPrimaryColor,
                                overlayColor: kPrimaryColorTransparent,
                                thumbShape: RoundSliderThumbShape(
                                    enabledThumbRadius: 10.0),
                                overlayShape: RoundSliderOverlayShape(
                                    overlayRadius: 15.0),
                              ),
                              child: Slider(
                                value: height.toDouble(),
                                min: 120.0,
                                max: 220.0,
                                onChanged: (double newValue) {
                                  setState(() {
                                    height = newValue.round();
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: ReusableCard(
                        color: kCardBackgroundColor,
                        cardChild: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              'WEIGHT',
                              style: kSimpleTextStyle,
                            ),
                            Text(
                              weight.toString(),
                              style: kInputTextStyle,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                RoundedIconButton(
                                  icon: Icon(FontAwesomeIcons.minus),
                                  onPressed: () {
                                    setState(() {
                                      if (weight >= 40) {
                                        weight--;
                                      }
                                    });
                                  },
                                ),
                                SizedBox(
                                  width: 10.0,
                                ),
                                RoundedIconButton(
                                  icon: Icon(FontAwesomeIcons.plus),
                                  onPressed: () {
                                    setState(() {
                                      if (weight <= 200) {
                                        weight++;
                                      }
                                    });
                                  },
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: ReusableCard(
                        color: kCardBackgroundColor,
                        cardChild: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              'AGE',
                              style: kSimpleTextStyle,
                            ),
                            Text(
                              age.toString(),
                              style: kInputTextStyle,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                RoundedIconButton(
                                  icon: Icon(FontAwesomeIcons.minus),
                                  onPressed: () {
                                    setState(() {
                                      if (age >= 10) {
                                        age--;
                                      }
                                    });
                                  },
                                ),
                                SizedBox(
                                  width: 10.0,
                                ),
                                RoundedIconButton(
                                  icon: Icon(FontAwesomeIcons.plus),
                                  onPressed: () {
                                    setState(() {
                                      if (age <= 100) {
                                        age++;
                                      }
                                    });
                                  },
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              BottomButton(
                onTap: () {
                  CalculatorBrain calc = CalculatorBrain(
                      weight: this.weight.toDouble(),
                      height: this.height.toDouble());

                  Navigator.pushNamed(context, '/results', arguments: {
                    'resultBMI': calc.getBMIResult(),
                    'resultTitle': calc.getResultTitle(),
                    'resultDetails': calc.getResultDetails(),
                  });
                },
                buttonText: 'CALCULATE',
              )
            ],
          ),
        ));
  }

  void selectGenre(Genre genre) {
    setState(() {
      maleBackgroundColor = (genre == Genre.Male)
          ? kCardBackgroundColor
          : kInactiveCardBackgroundColor;
      femaleBackgroundColor = (genre == Genre.Female)
          ? kCardBackgroundColor
          : kInactiveCardBackgroundColor;
    });
  }
}