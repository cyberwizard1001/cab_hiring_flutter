import 'package:cab_hiring_flutter/screens/landing_screen.dart';
import 'package:cab_hiring_flutter/utils/colors.dart' as colors;
import 'package:cab_hiring_flutter/widgets/custom_sliver_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:oktoast/oktoast.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            color: colors.scaffoldColor,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: CustomSliverView(
                columnList: [
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 20.0, bottom: 20, left: 10),
                    child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'Profile',
                          style: GoogleFonts.nunito(
                              fontSize: 30,
                              color: colors.primaryTextColor,
                              fontWeight: FontWeight.bold),
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: CircleAvatar(
                      backgroundColor: colors.textBoxColor,
                      minRadius: 70,
                      child: const Text(
                        'N',
                        style: TextStyle(fontSize: 65),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 30),
                    child: Text('Nirmal K',
                        style: GoogleFonts.nunito(
                            fontSize: 25,
                            color: colors.primaryTextColor,
                            fontWeight: FontWeight.bold)),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Text("@" + 'nirmalk',
                        style: GoogleFonts.nunito(
                            fontSize: 20,
                            color: Colors.white70,
                            fontWeight: FontWeight.bold)),
                  ),
                  Expanded(child: Container()),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.white,
                          onPrimary: colors.accentColor,
                        ),
                        onPressed: () {
                          showToast("Signed out successfully!");
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const LandingPage()));
                        },
                        child: Padding(
                            padding: const EdgeInsets.all(12),
                            child: Text(
                              "SIGN OUT",
                              style: GoogleFonts.nunito(
                                  fontSize: 16,
                                  color: colors.accentTextColor,
                                  fontWeight: FontWeight.bold),
                            )),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 3),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(right: 4),
                            child: ElevatedButton(
                                onPressed: () {},
                                child: Text(
                                  "CHANGE PASSWORD",
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.nunito(
                                      fontSize: 12,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                )),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 4),
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.red,
                                  onPrimary: colors.primaryTextColor,
                                ),
                                onPressed: () {},
                                child: Text(
                                  "DELETE ACCOUNT",
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.nunito(
                                      fontSize: 12,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                )),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )));
  }
}
