import 'dart:math';

import 'package:cab_hiring_flutter/screens/emergency_page.dart';
import 'package:cab_hiring_flutter/screens/ride_completion_page.dart';
import 'package:cab_hiring_flutter/screens/ride_page.dart';
import 'package:cab_hiring_flutter/utils/colors.dart' as colors;
import 'package:cab_hiring_flutter/widgets/custom_sliver_widget.dart';
import 'package:cab_hiring_flutter/widgets/fancy_button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CabInfoPage extends StatefulWidget {
  const CabInfoPage({Key? key}) : super(key: key);

  @override
  _CabInfoPageState createState() => _CabInfoPageState();
}

class _CabInfoPageState extends State<CabInfoPage> {
  Random random = Random();
  var driverName = "";
  var vehicleNumber = "";
  var carName = "";

  String randomTextGen() {
    var name = [
      'Vijay Prakash',
      'Nalin',
      'Arunkumar K',
      'Karthikeyan',
      'Gopal'
    ];
    driverName = name[random.nextInt(4)];
    return driverName;
  }

  String randomVehicleNumberGen() {
    var list = [
      'TN 38 Y 1234',
      'TN 40 XS 3245',
      'TN 60 X 123',
      'TN 21 AS 7276',
      'TN 12 Y 45'
    ];
    vehicleNumber = list[random.nextInt(4)];
    return vehicleNumber;
  }

  String randomCarNameGen() {
    var list = [
      'Black Indica eCS',
      'Maruti Suzuki Swift',
      'Suzuki Celerio',
      'Honda City',
      'Hyundai xCent'
    ];
    carName = list[random.nextInt(4)];
    return carName;
  }

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
                            "We've found the perfect cab!",
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
              padding: const EdgeInsets.only(top: 70, left: 20.0, right: 20.0),
              child: Align(
                alignment: Alignment.topLeft,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Driver name: ',
                        style: GoogleFonts.nunito(
                            color: const Color(0xff177171),
                            fontSize: 20,
                            fontWeight: FontWeight.normal),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        randomTextGen(),
                        style: GoogleFonts.nunito(
                            color: const Color(0xff177171),
                            fontSize: 25,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.star,
                          color: colors.accentColor,
                        ),
                        Card(
                          color: const Color(0xff177171),
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 8.0, right: 8.0, top: 2.0, bottom: 2.0),
                            child: Text(
                              '${random.nextInt(3) + random.nextInt(4)}.${random.nextInt(9)}',
                              style: GoogleFonts.nunito(
                                  color: colors.primaryTextColor),
                            ),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    Text(
                      randomCarNameGen(),
                      style: GoogleFonts.nunito(
                          color: const Color(0xff177171), fontSize: 20),
                    ),
                    Text(
                      randomVehicleNumberGen(),
                      style: GoogleFonts.nunito(
                          color: const Color(0xff177171),
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    Text(
                      'Arriving in ${random.nextInt(15) + 2} minutes',
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
                            builder: (context) => RidePage(
                                  driverName: driverName,
                                  carNumber: vehicleNumber,
                                  carName: carName,
                                )));
                      },
                      child: const Text('START RIDE'),
                      style: ElevatedButton.styleFrom(
                          primary: const Color(0xff177171)),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => RideCompletionPage()));
                      },
                      child: const Text('CANCEL/RESCHEDULE'),
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

//115 113 114 6 9 16 88 89
