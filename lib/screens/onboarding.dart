import 'package:cab_hiring_flutter/screens/signup_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cab_hiring_flutter/utils/colors.dart' as colors;
import 'package:flutter_svg/flutter_svg.dart';
import 'package:cab_hiring_flutter/utils/constants.dart' as constants;
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreens extends StatefulWidget {
  const OnboardingScreens({Key? key}) : super(key: key);

  @override
  State<OnboardingScreens> createState() => _OnboardingScreensState();
}

class _OnboardingScreensState extends State<OnboardingScreens> {
  final controller = PageController(viewportFraction: 1.0, keepPage: true);

  var text = [
    'Effortlessly book rides',
    'Economical, safe travel',
    'Travel with your friends',

  ];

  var subText = [
    'With Cabriolet, you can effortlessly book rides all from your smartphone with a seamless experience',
    'With Cabriolet, we offer economical and safe traveling for everyone to fit your wallet',
    'Experience carpooling at it\'s best as we seamlessly integrate finding people to ride wit. Play your part in making the globe greener',

  ];

  var image_location = [
    'assets/svg/register.svg',
    'assets/svg/update_events.svg',
    'assets/svg/view_events.svg',
    'assets/svg/rsvp_events.svg',
  ];

  @override
  Widget build(BuildContext context) {
    final pages = List.generate(
      text.length,
      (index) => Container(
        margin: const EdgeInsets.only(left: 10, right: 10),
        child: Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  flex: 1,
                  child: Container(),
                ),
                Expanded(
                  flex: 6,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20.0),
                    child: SvgPicture.asset(
                      image_location[index],
                    ),
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 50.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 5,
                          child: Column(children: [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                text[index],
                                style: GoogleFonts.nunito(
                                    fontSize: 25,
                                    fontWeight: FontWeight.w700,
                                    color: colors.primaryTextColor),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 20.0),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  subText[index],
                                  style: GoogleFonts.nunito(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w400,
                                      color: colors.primaryTextColor),
                                ),
                              ),
                            ),
                          ]),
                        ),
                        //Expanded(flex: 1,child: Container()),
                        Expanded(
                          flex: 1,
                          child: IconButton(
                                  onPressed: () {
                                    Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                            const SignUpPage()));
                                  },
                                  icon: Icon(Icons.chevron_right,color: colors.accentColor,))
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            )),
      ),
    );
    return CustomScrollView(
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Scaffold(
            backgroundColor: colors.scaffoldColor,
            body: Stack(children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      flex: 8,
                      child: PageView.builder(
                        controller: controller,
                        // itemCount: pages.length,
                        itemBuilder: (_, index) {
                          return pages[index % pages.length];
                        },
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SmoothPageIndicator(
                          controller: controller,
                          count: pages.length,
                          effect: const JumpingDotEffect(
                            dotHeight: 7,
                            dotWidth: 7,
                            jumpScale: .7,
                            verticalOffset: 10,
                          ),
                        ),
                        const SizedBox(
                          width: 30,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ]),
          ),
        ),
      ],
    );
  }
}
