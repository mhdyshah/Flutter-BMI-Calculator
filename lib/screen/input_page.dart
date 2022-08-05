import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';
import '../components/icon_content.dart';
import '../components/reusable_card.dart';
import 'results_page.dart';
import '../calculator_brain.dart';
// import '../components/bottom_button.dart';

const activeCardColor = Color(0xFF1D1E33);
const inactiveCardColor = Color(0xFF111328);

enum Gender { male, female }

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Color maleCardColor = inactiveCardColor;
  Color femaleCardColor = inactiveCardColor;
  int _currentSliderValue = 180;
  int weight = 80;
  int age = 22;

  void updateColor(Gender gender) {
    if (gender == Gender.male) {
      if (maleCardColor == inactiveCardColor) {
        maleCardColor = activeCardColor;
        femaleCardColor = inactiveCardColor;
      } else {
        maleCardColor = inactiveCardColor;
      }
    }
    if (gender == Gender.female) {
      if (femaleCardColor == inactiveCardColor) {
        femaleCardColor = activeCardColor;
        maleCardColor = inactiveCardColor;
      } else {
        femaleCardColor = inactiveCardColor;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
            child: Text(
          'BMI CALCULATOR',
          style: TextStyle(fontFamily: "PTSerif"),
        )),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                    child: GestureDetector(
                  onTap: () {
                    setState(() {
                      updateColor(Gender.male);
                    });
                  },
                  child: ReusableCard(
                    colour: maleCardColor,
                    cardChild: const IconContent(
                      icon: FontAwesomeIcons.mars,
                      label: "MALE",
                    ),
                  ),
                )),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        updateColor(Gender.female);
                      });
                    },
                    child: ReusableCard(
                      colour: femaleCardColor,
                      cardChild: const IconContent(
                        icon: FontAwesomeIcons.venus,
                        label: "FEMALE",
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                    child: ReusableCard(
                  colour: activeCardColor,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "HEIGHT",
                        style: TextStyle(
                            fontFamily: "MouseMemoirs",
                            fontSize: 28.0,
                            color: Color(0xFF8D8E98),
                            letterSpacing: 2.5),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          Text(
                            _currentSliderValue.toString(),
                            style: const TextStyle(
                                fontSize: 50.0, fontWeight: FontWeight.w900),
                          ),
                          const Text(
                            "cm",
                            style: TextStyle(
                                fontSize: 20.0,
                                fontFamily: "PTSerif",
                                color: Color(0xFF8D8E98)),
                          ),
                        ],
                      ),
                      SliderTheme(
                        data: SliderThemeData(
                          activeTrackColor: const Color(0xFFAF1D4A),
                          inactiveTrackColor:
                              const Color.fromARGB(255, 211, 157, 177),
                          thumbColor: const Color(0xFF264653),
                          thumbShape: const RoundSliderThumbShape(
                              enabledThumbRadius: 15.0),
                          overlayColor:
                              const Color(0xFF2A9D8F).withOpacity(0.5),
                          trackHeight: 3.0,
                        ),
                        child: Slider(
                          value: _currentSliderValue.toDouble(),
                          onChanged: (double value) {
                            setState(() {
                              _currentSliderValue = value.round();
                            });
                          },
                          min: 30.0,
                          max: 300.0,
                          label: "$_currentSliderValue",
                        ),
                      )
                    ],
                  ),
                )),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                    child: ReusableCard(
                  colour: activeCardColor,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "WEIGHT",
                        style: TextStyle(
                          fontFamily: "MouseMemoirs",
                          fontSize: 28.0,
                          color: Color(0xFF8D8E98),
                          letterSpacing: 2.5,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            weight.toString(),
                            style: const TextStyle(
                              fontSize: 40.0,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          const SizedBox(
                            width: 8.0,
                          ),
                          const Text(
                            "kg",
                            style: TextStyle(
                              fontSize: 22.0,
                              color: Color.fromARGB(255, 164, 9, 6),
                            ),
                          )
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FloatingActionButton(
                                backgroundColor: const Color(0xFF4C4F5E),
                                child: const Icon(
                                  FontAwesomeIcons.plus,
                                  color: Colors.white70,
                                ),
                                onPressed: () {
                                  setState(() {
                                    weight++;
                                  });
                                }),
                            const SizedBox(width: 10.0),
                            FloatingActionButton(
                                backgroundColor: const Color(0xFF4C4F5E),
                                child: const Icon(
                                  FontAwesomeIcons.minus,
                                  color: Colors.white70,
                                ),
                                onPressed: () {
                                  setState(() {
                                    weight--;
                                  });
                                }),
                          ],
                        ),
                      ),
                    ],
                  ),
                )),
                Expanded(
                    child: ReusableCard(
                  colour: activeCardColor,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "AGE",
                        style: TextStyle(
                          fontFamily: "MouseMemoirs",
                          fontSize: 28.0,
                          color: Color(0xFF8D8E98),
                          letterSpacing: 2.5,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            age.toString(),
                            style: const TextStyle(
                              fontSize: 35.0,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          const SizedBox(
                            width: 8.0,
                          ),
                          const Text(
                            "years",
                            style: TextStyle(
                              fontSize: 22.0,
                              color: Color.fromARGB(255, 164, 9, 6),
                            ),
                          )
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FloatingActionButton(
                                backgroundColor: const Color(0xFF4C4F5E),
                                child: const Icon(
                                  FontAwesomeIcons.plus,
                                  color: Colors.white70,
                                ),
                                onPressed: () {
                                  setState(() {
                                    age++;
                                  });
                                }),
                            const SizedBox(width: 10.0),
                            FloatingActionButton(
                              backgroundColor: const Color(0xFF4C4F5E),
                              child: const Icon(
                                FontAwesomeIcons.minus,
                                color: Colors.white70,
                              ),
                              onPressed: () {
                                setState(() {
                                  age--;
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ))
              ],
            ),
          ),
          // u can create your bottom-button with own class in (../components/bottom_button.dart)
          GestureDetector(
            onTap: () {
              CalculatorBrain bmi =
                  CalculatorBrain(height: _currentSliderValue, weight: weight);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultsPage(
                    bmiResult: bmi.calculateBMI(),
                    interpretation: bmi.getInterpretation(),
                    resultText: bmi.getResult(),
                  ),
                ),
              );
            },
            child: Container(
              color: const Color.fromARGB(255, 179, 18, 66),
              width: double.infinity,
              height: 50.0,
              margin: const EdgeInsets.only(top: 10.0),
              padding: const EdgeInsets.only(bottom: 20.0),
              child: const Text(
                "CALCULATE",
                textAlign: TextAlign.center,
                style: TextStyle(fontFamily: "Ramaraja", fontSize: 25.0),
              ),
            ),
          ),
        ],
      ),
    );
  }
}




// if u want u can create your own button like this
/*
class RoundIconButton extends StatelessWidget {
  const RoundIconButton({Key? key, required this.icon}) : super(key: key);

  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(icon),
      elevation: 6.0,
      constraints: BoxConstraints.tightFor(width: 60.0, height: 60.0),
      onPressed: () {},
      shape: const CircleBorder(),
      fillColor: const Color(0xFF4C4F5E),
    );
  }
}
*/