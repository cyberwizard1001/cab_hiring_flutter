import 'package:cab_hiring_flutter/screens/onboarding.dart';
import 'package:cab_hiring_flutter/screens/sign_in.dart';
import 'package:cab_hiring_flutter/utils/colors.dart' as colors;
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colors.scaffoldColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(flex: 1,child: Container()),
          Expanded(
            flex: 2,
            child: Center(
              child: SvgPicture.asset(
                'assets/logo_halo.svg',
                fit: BoxFit.fill,
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Center(
              child: Text(
                'Cabriolet',
                style: GoogleFonts.nunito(
                    color: colors.primaryTextColor,
                    fontSize: 50,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=> const SignInPage()));
                        },
                        child: Text(
                          'Sign In',
                          style: GoogleFonts.nunito(
                              color: colors.accentColor, fontSize: 15),
                        )),
                    IconButton(
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=> const OnboardingScreens()));
                        },
                        icon: Icon(
                          FontAwesomeIcons.arrowRight,
                          color: colors.accentColor,
                          size: 20,
                        ))
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
