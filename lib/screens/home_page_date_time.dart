import 'dart:async';

import 'package:cab_hiring_flutter/utils/colors.dart' as colors;
import 'package:cab_hiring_flutter/widgets/custom_sliver_widget.dart';
import 'package:cab_hiring_flutter/widgets/time_box_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../widgets/date_time_picker.dart';

class HomePageDateTime extends StatefulWidget {
  const HomePageDateTime({Key? key}) : super(key: key);

  @override
  State<HomePageDateTime> createState() => _HomePageDateTimeState();
}

class _HomePageDateTimeState extends State<HomePageDateTime> {
  final Completer<GoogleMapController> _controller = Completer();

  static const LatLng _center = LatLng(10.903416, 76.897906);

  LatLng _lastMapPosition = _center;
  final LatLng _sourceMarkerPosition = LatLng(11.089537, 76.946075);

  void _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
  }

  void _onCameraMove(CameraPosition position) {
    _lastMapPosition = position.target;
  }

  void _onSourceMarkerButtonPressed() {
    setState(() {
      _markers.add(Marker(
        // This marker id can be anything that uniquely identifies each marker.
        markerId: MarkerId(_lastMapPosition.toString()),
        position: _sourceMarkerPosition,
        infoWindow: const InfoWindow(
          title: 'Home',
          snippet: 'Source location',
        ),
        icon: BitmapDescriptor.defaultMarker,
      ));
    });
  }

  void _onDestinationMarkerButtonPressed() {
    setState(() {
      _markers.add(Marker(
        // This marker id can be anything that uniquely identifies each marker.
        markerId: MarkerId(_lastMapPosition.toString()),
        position: _lastMapPosition,
        infoWindow: const InfoWindow(
          title: 'Work',
          snippet: 'Destination location',
        ),
        icon:
        BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueMagenta),
      ));
    });
  }

  final Set<Marker> _markers = {};

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(color: colors.scaffoldColor),
      Scaffold(
          backgroundColor: Colors.transparent,
          body: Stack(children: [
            CustomSliverView(
              columnList: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: EdgeInsets.zero,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 500,
                          child: GoogleMap(
                            onMapCreated: _onMapCreated,
                            markers: _markers,
                            onCameraMove: _onCameraMove,
                            initialCameraPosition: const CameraPosition(
                              target: _center,
                              zoom: 15.0,
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Padding(padding: const EdgeInsets.only(top: 20.0,
                              left: 20.0,
                              right: 20.0), child: Text('Book your ride',
                            style: GoogleFonts.nunito(
                                color: colors.primaryTextColor,
                                fontWeight: FontWeight.w600,
                                fontSize: 25),),),
                        ),

                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: DatePickerWidget(
                      defaultDate: DateTime.now(),
                      context: context,
                      title: "Pick date for ride",
                      hint: "Choose a date",
                      autoValidateMode: AutovalidateMode.onUserInteraction,
                      onSaved: (data) {
                      },
                      validator: (val) {
                        if (val != null) if (val.isAfter(DateTime.now())) {
                          return 'Please choose a valid date';
                        }
                      },
                    ),
                  ),
                ),
                const TimePickerWidget(title: 'This is a widget',),
                Align(
                    alignment: Alignment.bottomRight,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 20.0, right: 20.0),
                      child: FloatingActionButton(
                        onPressed: () {

                        },
                        materialTapTargetSize: MaterialTapTargetSize.padded,
                        backgroundColor: colors.accentColor,
                        child: Icon(
                          Icons.check,
                          color: colors.accentTextColor,
                        ),
                      ),
                    )),
              ],
            ),
          ])),
    ]);
  }
}
