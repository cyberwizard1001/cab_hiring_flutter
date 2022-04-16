import 'package:cab_hiring_flutter/widgets/location_widget.dart';
import 'package:flutter/material.dart';
import 'package:cab_hiring_flutter/utils/colors.dart' as colors;



class LocationPage extends StatefulWidget {
  @override
  _LocationPageState createState() => _LocationPageState();
}

class _LocationPageState extends State<LocationPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colors.scaffoldColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            LocationWidgetField(context: context, title: 'Share location')
          ],
        ),
      ),
    );
  }
}
