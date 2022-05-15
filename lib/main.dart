import 'package:cab_hiring_flutter/screens/cab_info_page.dart';
import 'package:cab_hiring_flutter/screens/driver_details.dart';
import 'package:cab_hiring_flutter/screens/location_display.dart';
import 'package:cab_hiring_flutter/screens/post_ride.dart';
import 'package:flutter/material.dart';
import 'package:cab_hiring_flutter/screens/landing_screen.dart';
import 'package:cab_hiring_flutter/utils/themes.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: DriverDetailsPage(),
    //theme: darkTheme.,
  ));
}
