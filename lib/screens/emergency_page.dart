import 'package:cab_hiring_flutter/utils/colors.dart' as colors;
import 'package:cab_hiring_flutter/utils/notification_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sms/flutter_sms.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widgets/custom_sliver_widget.dart';
import 'home_page.dart';

class EmergencyPage extends StatefulWidget {
  const EmergencyPage({Key? key}) : super(key: key);

  @override
  _EmergencyPageState createState() => _EmergencyPageState();
}

class _EmergencyPageState extends State<EmergencyPage> {
  @override
  Widget build(BuildContext context) {
    NotificationService.showNotification(
        id: 0,
        title: 'ALERT!',
        body: 'Sentry mode has been turned on, device is now recording video');
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        backgroundColor: colors.errorColor,
        body: CustomSliverView(
          columnList: [
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding:
                const EdgeInsets.only(top: 150, left: 20.0, right: 20.0),
                child: Text(
                  'EMERGENCY',
                  style: GoogleFonts.montserrat(
                      color: colors.primaryTextColor,
                      fontSize: 35,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding:
                const EdgeInsets.only(top: 80, left: 20.0, right: 20.0,bottom: 100),
                child: Text(
                  'An alert message with your ride details has been sent to the emergency number registered. Please stay calm, we\'re doing our best to help you.',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.montserrat(
                    color: colors.primaryTextColor,
                    fontSize: 15,),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('DISABLE'),
              style: ElevatedButton.styleFrom(
                  primary: const Color(0xff177171)),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    _determinePosition(context);
  }
}

Future<Position> _determinePosition(context) async {
  bool serviceEnabled;
  LocationPermission permission;
  BuildContext? progressContext;

  serviceEnabled = await Geolocator.isLocationServiceEnabled();

  if (!serviceEnabled) {
    return Future.error(
        'Location services are disabled, try enabling location in your device');
  }

  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      return Future.error('Location permissions are denied');
    }
  }

  if (permission == LocationPermission.deniedForever) {
    return Future.error(
        'Location permissions are permanently denied, permission cannot be requested.');
  }

  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      progressContext = context;
      return WillPopScope(
          child: Dialog(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  Padding(
                    padding: EdgeInsets.only(right: 20),
                    child: CircularProgressIndicator(),
                  ),
                  Text(
                    "Fetching Location",
                    style: TextStyle(color: Colors.black),
                  ),
                ],
              ),
            ),
          ),
          onWillPop: () async => false);
    },
  );

  var location = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.best);

  //Share.share("Traveler's current location is: " + location.toString());
  Navigator.of(progressContext!, rootNavigator: true).pop();
  String? userName = 'Nirmal K';
  String message =
      "$userName might need quick help right now, unusual activities identified reported while in cab. Located at https://www.google.com/maps?q=${location.latitude},${location.longitude}";
  List<String> recipients = ["8220589062"]; //TODO: Replace list

  _sendSMS(message, recipients);
  return location;
}

void _sendSMS(String message, List<String> rec) async {
  String _result =
      await sendSMS(message: message, recipients: rec).catchError((onError) {
    print(onError);
  });
  print(_result);
}
