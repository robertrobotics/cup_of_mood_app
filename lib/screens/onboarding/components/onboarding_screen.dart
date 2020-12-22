import 'package:cup_of_mood_mobile/screens/onboarding/components/first_onboarding_screen.dart';
import 'package:cup_of_mood_mobile/screens/onboarding/components/second_onboarding_screen.dart';
import 'package:flutter/material.dart';

class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int _currentPage = 0;
  final PageController _pageController = PageController(initialPage: 0);
  final int _numberOfPages = 3;

  String _selectedUsername;

  void updateUsername(String username) {
    setState(() {
      _selectedUsername = username;
    });
  }

  // Build actual widget
  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: _pageController,
      scrollDirection: Axis.horizontal,
      children: [
        FirstOnboardingScreen(
          usernameUpdatedCallback: updateUsername,
        ),
        SecondOnboardingScreen(username: _selectedUsername),
        FirstOnboardingScreen()
      ],
    );
  }
}
