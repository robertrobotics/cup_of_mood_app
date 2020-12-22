import 'package:cup_of_mood_mobile/constants.dart';
import 'package:flutter/material.dart';

class SecondOnboardingScreen extends StatefulWidget {
  final String username;

  const SecondOnboardingScreen({Key key, this.username}) : super(key: key);

  @override
  _SecondOnboardingScreenState createState() => _SecondOnboardingScreenState();
}

class _SecondOnboardingScreenState extends State<SecondOnboardingScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: kBackgroundColor,
      alignment: Alignment.center,
      child: Text(widget.username != null ? widget.username : "Non provided"),
    );
  }
}
