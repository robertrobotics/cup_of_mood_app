import 'package:cup_of_mood_mobile/components/inputs/text_input.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../constants.dart';

class FirstOnboardingScreen extends StatefulWidget {
  final Function(String) updateUsernameCallback;

  const FirstOnboardingScreen({Key key, @required this.updateUsernameCallback})
      : super(key: key);

  @override
  _FirstOnboardingScreenState createState() => _FirstOnboardingScreenState();
}

class _FirstOnboardingScreenState extends State<FirstOnboardingScreen> {
  // user's name text-box related fields
  final _usernameTextBoxController = TextEditingController();

  // Initialize state
  @override
  void initState() {
    super.initState();

    _usernameTextBoxController.addListener(() {
      widget.updateUsernameCallback(
          _usernameTextBoxController.text.toUpperCase());
    });
  }

  // Make sure all `hard` assets will be disposed when needed
  @override
  void dispose() {
    _usernameTextBoxController.dispose();
    super.dispose();
  }

  // Build actual widget
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double screenHeight = screenSize.height;
    double screenWidth = screenSize.width;

    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);

        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
        backgroundColor: kBackgroundColor,
        resizeToAvoidBottomPadding: false,
        body: AnnotatedRegion<SystemUiOverlayStyle>(
          value: SystemUiOverlayStyle.light,
          child: Column(children: [
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(
                        left: 0.1 * screenWidth, top: 0.13 * screenHeight),
                    child: Row(
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'Find your',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 0.06 * screenHeight,
                                  fontFamily: 'RobotoLight'),
                            ),
                            Text(
                              'Coffee',
                              style: TextStyle(
                                  color: kGoldenPrimaryColor,
                                  fontSize: 0.086 * screenHeight,
                                  fontFamily: 'RobotoLight'),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 30, right: 20),
                              child: SvgPicture.asset(
                                'assets/images/first_screen_arrows.svg',
                                height: 0.17 * screenWidth,
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 30),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/images/first_screen_woman.png',
                          height: 0.7 * screenWidth,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 40.0, right: 40.0, top: 30.0),
                    child: TextBox(
                      hintText: 'Type your name',
                      controller: _usernameTextBoxController,
                    ),
                  ),
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }

  Container buildNavigationDot({bool active = false}) {
    return Container(
      margin: EdgeInsets.only(right: 10),
      height: 27,
      width: 27,
      decoration: BoxDecoration(
          color: active ? kGoldenPrimaryColor : Colors.transparent,
          border: Border.all(width: 2, color: kGoldenPrimaryColor),
          borderRadius: BorderRadius.circular(13)),
    );
  }
}
