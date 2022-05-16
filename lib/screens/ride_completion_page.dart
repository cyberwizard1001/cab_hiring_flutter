import 'dart:math';

import 'package:cab_hiring_flutter/screens/home_page.dart';
import 'package:cab_hiring_flutter/utils/colors.dart' as colors;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widgets/custom_sliver_widget.dart';

class RideCompletionPage extends StatelessWidget {
  Random random = Random();

  RideCompletionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xff9BDADA),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: CustomSliverView(columnList: [
            Padding(
              padding: const EdgeInsets.only(top: 80.0),
              child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Thank you for riding with us!",
                    style: GoogleFonts.nunito(
                        fontSize: 40, color: const Color(0xff177171)),
                  )),
            ),
            const SizedBox(
              height: 50,
            ),
            Align(
              alignment: Alignment.topLeft,
              child: SizedBox(
                height: 140,
                width: 250,
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            'Charges :',
                            style: GoogleFonts.nunito(
                                fontSize: 20, color: const Color(0xff177171)),
                          ),
                        ),
                        Align(
                            alignment: Alignment.topRight,
                            child: Text(
                              'Rs. ${random.nextInt(8) + 1}${random.nextInt(9)}${random.nextInt(9)}',
                              style: GoogleFonts.nunito(
                                  fontSize: 50,
                                  fontWeight: FontWeight.w700,
                                  color: const Color(0xff004D4D)),
                            )),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30, right: 50, bottom: 80),
              child: Text(
                'Payment can be done through any payment method available and will be handled by a secure payment portal',
                style: GoogleFonts.nunito(
                    fontSize: 16, color: const Color(0xff004D4D)),
              ),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: ElevatedButton(
                onPressed: () {
                  _displayTextInputDialog(context);
                },
                child: const Text('PAY WITH CASH'),
                style:
                    ElevatedButton.styleFrom(primary: const Color(0xff004D4D)),
              ),
            )
          ]),
        ));
  }

  Future<void> _displayTextInputDialog(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            insetPadding: const EdgeInsets.only(
                left: 0, right: 0.0, top: 30.0, bottom: 30.0),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
            title: Center(
              child: Text(
                'PAY BY CASH',
                style: GoogleFonts.nunito(
                    color: colors.scaffoldColor,
                    fontSize: 25,
                    fontWeight: FontWeight.w600),
              ),
            ),
            titlePadding: const EdgeInsets.only(top: 20, bottom: 40.0),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: const [
                Text('Verify payment status'),
              ],
            ),
            actions: <Widget>[
              Center(
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: const Color(0xff004D4D)),
                      child: Text('VERIFY',
                          style: GoogleFonts.nunito(
                              color: colors.primaryTextColor,
                              fontWeight: FontWeight.bold)),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const HomePage()));
                      })),
            ],
          );
        });
  }
}
