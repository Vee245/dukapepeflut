import 'dart:async';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

import 'home_page.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => StartState();
}

class StartState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return initScreen(context);
  }

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  startTimer() async {
    var duration = Duration(seconds: 3);
    print("I want Duration $duration");
    return new Timer(duration, route);
  }

  route() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => MyHomePage()));
  }

  initScreen(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(
            child: Container(
              child: Image.asset(
                "assets/images/dukapepelogo.png",
                height: 300,
                width: 300,
              ),
            ),
          ),
          Padding(padding: EdgeInsets.only(top: 20.0)),
          Padding(padding: EdgeInsets.only(top: 20.0)),
          SizedBox(
            height: 50,
          ),
          Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(color: Colors.black),
                  height: 300.0,
                  width: 350.0,
                  child: Center(
                    child: wavy(),
                  ),
                )
              ],
            ),
          ),

          /* SleekCircularSlider(
              min: 0,
              max: 100,
              initialValue: 100,
              appearance: CircularSliderAppearance(
                customWidths: CustomSliderWidths(
                  progressBarWidth: 2,
                ),
                infoProperties: InfoProperties(
                    mainLabelStyle: TextStyle(
                      color: Colors.red,
                      fontSize: 20,
                    )
                ),
                customColors: CustomSliderColors(
                    dotColor: Colors.white,
                    progressBarColor: Colors.red,
                    shadowColor: Colors.white,
                    trackColor: Colors.white),
                spinnerDuration: 4,
                animDurationMultiplier: 4,
                animationEnabled: true,
                startAngle: 0.0,
                angleRange: 360,
              ),
            ),*/
          SizedBox(
            height: 20.0,
          ),

          /*  Text(
              'Initializing app...',
              style: TextStyle(color: Colors.red, fontSize: 15,),
            ),*/
        ],
      ),
    );
  }

  wavy() {
    return DefaultTextStyle(
        style: const TextStyle(
          color: Colors.red,
        ),
        child: AnimatedTextKit(
          animatedTexts: [
            WavyAnimatedText("Initializing app...",
                speed: Duration(milliseconds: 200))
          ],
          isRepeatingAnimation: true,
          repeatForever: true,
        ));
  }
}
