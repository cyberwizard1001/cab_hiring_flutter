import 'package:cab_hiring_flutter/widgets/custom_sliver_widget.dart';
import 'package:cab_hiring_flutter/widgets/dropdown_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';

class PostRidePage extends StatefulWidget {
  const PostRidePage({Key? key}) : super(key: key);

  @override
  State<PostRidePage> createState() => _PostRidePageState();
}

class _PostRidePageState extends State<PostRidePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff9BDADA),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: CustomSliverView(
          columnList: [
            Padding(
              padding: const EdgeInsets.only(top: 100, bottom: 40),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50.0),
                child: Center(
                  child: Text(
                    'Thank you for riding with us!',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.nunito(
                        fontWeight: FontWeight.w600,
                        fontSize: 35,
                        color: const Color(0xff177171)),
                  ),
                ),
              ),
            ),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15.0),
                      child: Row(
                        children: [
                          Text(
                            'Rate the driver: ',
                            style: GoogleFonts.nunito(
                                fontSize: 17.0, fontWeight: FontWeight.w600),
                          ),
                          RatingBar.builder(
                            initialRating: 3,
                            minRating: 1,
                            direction: Axis.horizontal,
                            allowHalfRating: true,
                            itemCount: 5,
                            itemPadding:
                                const EdgeInsets.symmetric(horizontal: 4.0),
                            itemBuilder: (context, _) => const Icon(
                              Icons.star,
                              color: Colors.amber,
                            ),
                            onRatingUpdate: (rating) {
                              print(rating);
                            },
                          )
                        ],
                      ),
                    ),
                    const Divider(
                      thickness: 1.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15.0),
                      child: Row(
                        children: [
                          Text(
                            'Rate the vehicle: ',
                            style: GoogleFonts.nunito(
                                fontSize: 16.0, fontWeight: FontWeight.w600),
                          ),
                          RatingBar.builder(
                            initialRating: 3,
                            minRating: 1,
                            direction: Axis.horizontal,
                            allowHalfRating: true,
                            itemCount: 5,
                            itemPadding:
                                const EdgeInsets.symmetric(horizontal: 4.0),
                            itemBuilder: (context, _) => const Icon(
                              Icons.star,
                              color: Colors.amber,
                            ),
                            onRatingUpdate: (rating) {
                              print(rating);
                            },
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(),
              flex: 1,
            ),
            DropDownFormField(
              hint: 'Choose a payment method',
              title: 'Payment Method',
              list: const ['Cash', 'Card', 'GPay', "Other UPI apps"],
            ),
            Expanded(child: Container()),
            Text(
              'To offer feedback, call +422 2647588',
              style: GoogleFonts.nunito(fontWeight: FontWeight.bold,fontSize: 20),
            ),
            Expanded(child: Container()),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(onPressed: (){}, child: Text('PROCEED',style: GoogleFonts.nunito(fontSize: 20.0,fontWeight: FontWeight.bold,color: const Color(0xff9BDADA)),),style: ElevatedButton.styleFrom(primary: const Color(0xff546E6E)),),
              ],
            )
          ],
        ),
      ),
    );
  }
}
