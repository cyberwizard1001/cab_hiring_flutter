import 'package:cab_hiring_flutter/screens/onboarding.dart';
import 'package:flutter/material.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => OnboardingScreens()));
        },
      ),
      body: Container(
        child: ElevatedButton(
          child: Text('Click here'),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => OnboardingScreens()));
          },
        ),
      ),
    );
  }
}
