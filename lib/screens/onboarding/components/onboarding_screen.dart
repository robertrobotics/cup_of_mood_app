import 'package:cup_of_mood_mobile/constants.dart';
import 'package:cup_of_mood_mobile/screens/onboarding/change_notifiers/user_preferences_info_provider.dart';
import 'package:cup_of_mood_mobile/screens/onboarding/components/first_onboarding_screen.dart';
import 'package:cup_of_mood_mobile/screens/onboarding/components/second_onboarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController(initialPage: 0);
  int _numberOfPages = 3;
  int _currentPage = 0;

  // Build actual widget
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<UserPreferencesInfoProvider>(
      create: (context) => UserPreferencesInfoProvider(),
      child: Consumer<UserPreferencesInfoProvider>(
          builder: (context, provider, child) {
        return Container(
          color: kBackgroundColor,
          child: Column(
            children: [
              Expanded(
                child: PageView(
                  onPageChanged: (value) {
                    setState(() {
                      _currentPage = value;
                    });
                  },
                  controller: _pageController,
                  scrollDirection: Axis.horizontal,
                  children: [
                    FirstOnboardingScreen(
                      updateUsernameCallback: (username) {
                        if (username != null || username != "") {
                          provider.setUserName(username);
                        }
                      },
                    ),
                    SecondOnboardingScreen(username: provider.username)
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 40.0),
                color: kBackgroundColor,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                        _numberOfPages,
                        (index) =>
                            buildNavigationDot(active: index == _currentPage))),
              ),
            ],
          ),
        );
      }),
    );
  }

  AnimatedContainer buildNavigationDot({bool active = false}) {
    return AnimatedContainer(
      margin: EdgeInsets.only(right: 16),
      height: 22,
      width: 22,
      decoration: BoxDecoration(
          color: active ? kGoldenPrimaryColor : Colors.transparent,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(width: 3, color: kGoldenPrimaryColor)),
      duration: Duration(milliseconds: 200),
    );
  }
}
