import 'package:cab_hiring_flutter/screens/post_ride.dart';
import 'package:cab_hiring_flutter/widgets/custom_sliver_widget.dart';
import 'package:flutter/material.dart';
import 'package:cab_hiring_flutter/utils/colors.dart' as colors;
import 'package:google_fonts/google_fonts.dart';

import '../widgets/fancy_button.dart';
import 'dart:math';

import 'emergency_page.dart';


class RidePage extends StatelessWidget {
  var driverName = "";
  var carName = "";
  var carNumber = "";

  RidePage({Key? key, required this.driverName, required this.carName, required this.carNumber}) : super(key: key);

  final Random random = Random();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: const Color(0xff9BDADA),
          ),
          CustomSliverView(columnList: [
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 100),
              child: Row(
                children: [
                  Expanded(
                      flex: 2,
                      child: Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            "Enjoy your ride :)",
                            style: GoogleFonts.nunito(
                                fontSize: 40, color: const Color(0xff177171)),
                          ))),
                  Expanded(
                    flex: 1,
                    child: Column(
                      children: const [
                        FancyButton(
                          title: 'Call',
                          icon: Icons.phone,
                        ),
                        FancyButton(
                          title: 'Track',
                          icon: Icons.pin_drop,
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 100, left: 20.0, right: 20.0),
              child: Align(
                alignment: Alignment.topLeft,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Driver Name:',
                        style: GoogleFonts.nunito(
                            color: const Color(0xff177171),
                            fontSize: 20,
                            fontWeight: FontWeight.normal),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        driverName,
                        style: GoogleFonts.nunito(
                            color: const Color(0xff177171),
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    Text(
                      carName,
                      style: GoogleFonts.nunito(
                          color: const Color(0xff177171), fontSize: 20),
                    ),
                    Text(
                      carNumber,
                      style: GoogleFonts.nunito(
                          color: const Color(0xff177171),
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    Text(
                      'Destination in ${random.nextInt(15)} minutes',
                      style: GoogleFonts.nunito(
                          color: const Color(0xff177171),
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const PostRidePage()));
                      },
                      child: const Text('CANCEL RIDE'),
                      style: ElevatedButton.styleFrom(
                          primary: const Color(0xff177171)),
                    ),
                    Text(
                      'Note, cancellation will incur a 15% fee',
                      style: GoogleFonts.nunito(
                          color: Colors.black.withOpacity(0.6)),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const EmergencyPage()));
                      },
                      child: const Text('EMERGENCY'),
                      style:
                      ElevatedButton.styleFrom(primary: colors.errorColor),
                    )
                  ],
                ),
              ),
            ),
          ])
        ],
      ),
    );
  }
}
