import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../constants.dart';

class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final int _numberOfPages = 3;
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double screenHeight = screenSize.height;
    double screenWidth = screenSize.width;

    return Scaffold(
        backgroundColor: kBackgroundColor,
        body: AnnotatedRegion<SystemUiOverlayStyle>(
          value: SystemUiOverlayStyle.light,
          child: Container(
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
                                fontSize: 48.0,
                                fontFamily: 'RobotoLight'),
                          ),
                          Text(
                            'Coffee',
                            style: TextStyle(
                                color: kGoldenPrimaryColor,
                                fontSize: 64.0,
                                fontFamily: 'RobotoLight'),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 30, right: 20),
                            child: SvgPicture.asset(
                              'assets/images/first_screen_arrows.svg',
                              height: 0.2 * screenWidth,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 50),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/images/first_screen_woman.png',
                        height: 0.75 * screenWidth,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
