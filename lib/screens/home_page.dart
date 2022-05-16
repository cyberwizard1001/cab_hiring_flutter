import 'dart:async';

import 'package:cab_hiring_flutter/screens/home_page_date_time.dart';
import 'package:cab_hiring_flutter/utils/colors.dart' as colors;
import 'package:cab_hiring_flutter/widgets/custom_sliver_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
        body: Stack(
          children: [
            CustomSliverView(columnList: [
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: EdgeInsets.zero,
                  child: Column(children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height,
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
                  ]),
                ),
              ),
            ]),
            Align(
              alignment: Alignment.bottomCenter,
              child: ElevatedButton(
                onPressed: () {
                  showMaterialModalBottomSheet(
                      backgroundColor: colors.scaffoldColor,
                      context: context,
                      builder: (context) => SingleChildScrollView(
                            controller: ModalScrollController.of(context),
                            child: Column(
                              children: [
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        top: 20.0, left: 20.0, right: 20.0),
                                    child: Text(
                                      'Book your ride',
                                      style: GoogleFonts.nunito(
                                          color: colors.primaryTextColor,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 25),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      bottom: 15,
                                      left: 20.0,
                                      right: 20.0,
                                      top: 20.0),
                                  child: TextFormField(
                                      //controller: _nameController,
                                      style: GoogleFonts.montserrat(
                                          color: colors.primaryTextColor),
                                      validator: (value) {
                                        if (value == "" || value == null) {
                                          return "Please enter a valid location";
                                        } else {
                                          return null;
                                        }
                                      },
                                      decoration: InputDecoration(
                                        label: Text('Source Location',
                                            style: GoogleFonts.nunito(
                                                color: colors.textBoxTextColor,
                                                fontSize: 17)),
                                        filled: true,
                                        hintText: 'Enter your pickup location',
                                        hintStyle: GoogleFonts.poppins(
                                            color: colors.textBoxTextColor),
                                        focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide.none,
                                            borderRadius:
                                                BorderRadius.circular(5)),
                                        fillColor: colors.textBoxColor,
                                        focusColor: colors.textBoxColor,
                                        enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide.none,
                                            borderRadius:
                                                BorderRadius.circular(5)),
                                      )),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      bottom: 20, left: 20.0, right: 20.0),
                                  child: TextFormField(
                                      //controller: _nameController,
                                      style: GoogleFonts.montserrat(
                                          color: colors.primaryTextColor),
                                      validator: (value) {
                                        if (value == "" || value == null) {
                                          return "Please enter a valid location";
                                        } else {
                                          return null;
                                        }
                                      },
                                      decoration: InputDecoration(
                                        label: Text('Destination',
                                            style: GoogleFonts.nunito(
                                                color: colors.textBoxTextColor,
                                                fontSize: 17)),
                                        filled: true,
                                        hintText: 'Enter your destination',
                                        hintStyle: GoogleFonts.poppins(
                                            color: colors.textBoxTextColor),
                                        focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide.none,
                                            borderRadius:
                                                BorderRadius.circular(5)),
                                        fillColor: colors.textBoxColor,
                                        focusColor: colors.textBoxColor,
                                        enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide.none,
                                            borderRadius:
                                                BorderRadius.circular(5)),
                                      )),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 20.0, right: 20.0),
                                  child: Align(
                                    alignment: Alignment.topLeft,
                                    child: ElevatedButton(
                                        onPressed: () {
                                          _onSourceMarkerButtonPressed();
                                          _onDestinationMarkerButtonPressed();
                                        },
                                        style: ElevatedButton.styleFrom(
                                            primary: colors.accentColor),
                                        child: Text(
                                          'CONFIRM LOCATIONS',
                                          style: GoogleFonts.nunito(
                                              color: colors.accentTextColor,
                                              fontWeight: FontWeight.bold),
                                        )),
                                  ),
                                )
                              ],
                            ),
                          ));
                },
                style: ElevatedButton.styleFrom(primary: colors.accentColor),
                child: Text(
                  'BOOK RIDE',
                  style: GoogleFonts.nunito(
                      fontSize: 17.0,
                      fontWeight: FontWeight.bold,
                      color: colors.accentTextColor),
                ),
              ),
            ),
            Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 20.0, right: 20.0),
                  child: FloatingActionButton(
                    elevation: 10,
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const HomePageDateTime()));
                    },
                    //materialTapTargetSize: MaterialTapTargetSize.padded,
                    backgroundColor: colors.accentColor,
                    child: Icon(
                      Icons.check,
                      color: colors.accentTextColor,
                    ),
                  ),
                )),
          ],
        ),
      )
    ]);
  }
}
