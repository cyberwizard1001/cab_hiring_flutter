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
              padding: EdgeInsets.only(top: 100, left: 20.0, right: 20.0),
              child: Align(
                alignment: Alignment.topLeft,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Vijay Prakash',
                        style: GoogleFonts.nunito(
                            color: Color(0xff177171),
                            fontSize: 20,
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
                          color: Color(0xff177171),
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 8.0, right: 8.0, top: 2.0, bottom: 2.0),
                            child: Text(
                              '4.8',
                              style: GoogleFonts.nunito(
                                  color: colors.primaryTextColor),
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    Text(
                      'White Tesla Y',
                      style: GoogleFonts.nunito(
                          color: Color(0xff177171), fontSize: 20),
                    ),
                    Text(
                      'TN 38 A 1001',
                      style: GoogleFonts.nunito(
                          color: Color(0xff177171),
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    Text(
                      'Arriving in 10 minutes',
                      style: GoogleFonts.nunito(
                          color: Color(0xff177171),
                          fontWeight: FontWeight.bold,
                      fontSize: 20),
                    ),
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
