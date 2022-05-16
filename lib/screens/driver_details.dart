import 'package:cab_hiring_flutter/utils/colors.dart' as colors;
import 'package:cab_hiring_flutter/widgets/custom_sliver_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DriverDetailsPage extends StatefulWidget {
  const DriverDetailsPage({Key? key}) : super(key: key);

  @override
  State<DriverDetailsPage> createState() => _DriverDetailsPageState();
}

class _DriverDetailsPageState extends State<DriverDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colors.primaryTextColor,
      body: Padding(
        padding: EdgeInsets.all(20),
        child: CustomSliverView(
          columnList: [
            Padding(
              padding: const EdgeInsets.only(top: 50, bottom: 50),
              child: Center(
                child: Text(
                  'Driver Details',
                  style: GoogleFonts.nunito(
                      color: const Color(0xff686868),
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Card(
              color: const Color(0xffF5F6FA),
              child: Padding(
                padding: EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      child: Text(
                        'VP',
                        style: GoogleFonts.nunito(
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                            color: colors.primaryTextColor),
                      ),
                      foregroundColor: colors.primaryTextColor,
                      backgroundColor: colors.accentColor,
                      minRadius: 40,
                    ),
                    SizedBox(height: 20,),
                    SizedBox(
                      width: 100,
                      child: Card(
                        color: colors.accentColor,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Center(
                            child: Text(
                              'PRO',
                              style: GoogleFonts.nunito(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17,
                                  color: colors.accentTextColor),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 30, bottom: 30),
                      child: Text(
                        'Vijay Prakash',
                        style: GoogleFonts.nunito(
                            fontWeight: FontWeight.bold, fontSize: 23),
                      ),
                    ),
                    Text(
                      'Cab driver',
                      style: GoogleFonts.nunito(fontSize: 20),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 30, top: 30),
                      child: Center(
                          child: Text(
                        'Vijay is an excellent driver, and has been rated an average of 4.8 stars by over 300 users',
                        style: GoogleFonts.nunito(
                            color: const Color(0xff22215B).withOpacity(0.6),
                            fontSize: 17),
                        textAlign: TextAlign.center,
                      )),
                    ),
                    Card(
                      color: colors.primaryTextColor,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 15.0, horizontal: 10),
                            child: Column(
                              children: [
                                const Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                ),
                                Row(
                                  children: [
                                    Text(
                                      '4.8',
                                      style: GoogleFonts.nunito(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      ' stars',
                                      style: GoogleFonts.nunito(
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          VerticalDivider(
                            thickness: 1,
                            color: colors.scaffoldColor,
                            width: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 15.0, horizontal: 10),
                            child: Column(
                              children: [
                                Icon(
                                  Icons.car_rental,
                                  color: colors.scaffoldColor,
                                ),
                                Row(
                                  children: [
                                    Text(
                                      '126',
                                      style: GoogleFonts.nunito(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      ' trips',
                                      style: GoogleFonts.nunito(
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          VerticalDivider(
                            thickness: 1,
                            color: colors.scaffoldColor,
                            width: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 15.0, horizontal: 10),
                            child: Column(
                              children: [
                                Icon(
                                  Icons.timelapse,
                                  color: colors.scaffoldColor,
                                ),
                                Row(
                                  children: [
                                    Text(
                                      '3',
                                      style: GoogleFonts.nunito(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      ' Years',
                                      style: GoogleFonts.nunito(
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20, bottom: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          OutlinedButton(
                            onPressed: () {},
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 12),
                              child: Text('Message',
                                  style: GoogleFonts.nunito(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                      color: colors.accentTextColor)),
                            ),
                            style: OutlinedButton.styleFrom(
                                onSurface: colors.accentColor),
                          ),
                          ElevatedButton(
                            onPressed: () {},
                            child: SizedBox(
                              width: 100,
                              height: 50,
                              child: Center(
                                child: Text(
                                  'Call',
                                  style: GoogleFonts.nunito(
                                      fontWeight: FontWeight.bold,
                                      color: colors.accentTextColor,
                                      fontSize: 23),
                                ),
                              ),
                            ),
                            style: ElevatedButton.styleFrom(
                                primary: colors.accentColor),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Expanded(child: Container()),
            ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(primary: const Color(0xffF35E5E)),
                child: SizedBox(
                  height: 50,
                  child: Center(
                    child: Text(
                      'REPORT',
                      style: GoogleFonts.nunito(
                          fontWeight: FontWeight.bold,
                          color: colors.primaryTextColor,
                          fontSize: 20),
                    ),
                  ),
                )),
            Expanded(child: Container())
          ],
        ),
      ),
    );
  }
}
