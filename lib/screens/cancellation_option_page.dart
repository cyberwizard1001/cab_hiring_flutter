import 'package:cab_hiring_flutter/utils/colors.dart' as colors;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:timer_button/timer_button.dart';

import 'cab_info_page.dart';

class CancellationGracePage extends StatefulWidget {
  const CancellationGracePage({Key? key}) : super(key: key);

  @override
  State<CancellationGracePage> createState() => _CancellationGracePageState();
}

class _CancellationGracePageState extends State<CancellationGracePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colors.scaffoldColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 200.0),
            child: Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(primary: colors.errorColor),
                child: Text("CANCEL WITHOUT FEE"),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
            child: Text(
              'Please cancel the ride now if you booked it by mistake or if you want to update the itinerary. Later cancellation will include a 15% fee.',
              style: GoogleFonts.nunito(color: colors.textBoxLightColor),
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 450.0),
            child: Center(
              child: TimerButton(
                label: "PROCEED",
                timeOutInSeconds: 20,
                resetTimerOnPressed: false,
                buttonType: ButtonType.ElevatedButton,
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> CabInfoPage()));
                },
                disabledColor: colors.textBoxColor,
                color: colors.accentColor,
                disabledTextStyle:
                    TextStyle(fontSize: 20.0, color: colors.primaryTextColor),
                activeTextStyle:
                    TextStyle(fontSize: 20.0, color: colors.primaryTextColor),
              ),
            ),
          )
        ],
      ),
    );
  }
}
