import 'package:cup_of_mood_mobile/components/inputs/image_button.dart';
import 'package:cup_of_mood_mobile/constants.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:flutter_svg/flutter_svg.dart';

class SecondOnboardingScreen extends StatefulWidget {
  final String username;

  const SecondOnboardingScreen({Key key, this.username}) : super(key: key);

  @override
  _SecondOnboardingScreenState createState() => _SecondOnboardingScreenState();
}

class _SecondOnboardingScreenState extends State<SecondOnboardingScreen> {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double screenHeight = screenSize.height;
    double screenWidth = screenSize.width;
    String username = widget.username != null && widget.username.length > 0
        ? '${widget.username[0].toUpperCase()}${widget.username.substring(1).toLowerCase()}'
        : 'user';

    return Scaffold(
      body: Container(
        color: kBackgroundColor,
        padding:
            EdgeInsets.only(left: 24.0, right: 24.0, top: 0.1 * screenHeight),
        alignment: Alignment.center,
        child: Column(
          children: [
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Hello ",
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: "Roboto",
                            fontWeight: FontWeight.w200,
                            fontSize: 32)),
                    Text('${username},',
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: "Roboto",
                            fontWeight: FontWeight.w500,
                            fontSize: 32))
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("which one do you like the most?",
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: "Roboto",
                            fontWeight: FontWeight.w200,
                            fontSize: 20)),
                  ],
                ),
                Container(
                  padding: EdgeInsets.only(top: 48),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text("I love",
                              style: TextStyle(
                                  color: kGoldenPrimaryColor,
                                  fontFamily: "Roboto",
                                  fontWeight: FontWeight.w300,
                                  fontSize: 72)),
                          Padding(
                            padding: const EdgeInsets.only(left: 16.0),
                            child: Transform.rotate(
                              angle: math.pi / 2,
                              child: SvgPicture.asset(
                                'assets/images/first_screen_arrows.svg',
                                height: 0.12 * screenWidth,
                              ),
                            ),
                          )
                        ],
                      ),
                      ImageButton(
                          image: Image.asset(
                        'assets/images/TeaButton.png',
                        width: 260,
                        fit: BoxFit.cover,
                      )),
                      ImageButton(
                          onButtonTapHandler: () => {},
                          image: Image.asset(
                            'assets/images/CoffeeButton.png',
                            width: 260,
                            fit: BoxFit.cover,
                          )),
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
