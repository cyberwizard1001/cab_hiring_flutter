import 'package:cab_hiring_flutter/utils/colors.dart' as colors;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TimePickerWidget extends StatefulWidget {
  const TimePickerWidget({Key? key, this.title}) : super(key: key);

  final title;

  @override
  State<TimePickerWidget> createState() => _TimePickerWidgetState();
}

class _TimePickerWidgetState extends State<TimePickerWidget> {
  TimeOfDay selectedTime = TimeOfDay.now();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: colors.scaffoldColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 30.0),
            child: Align(alignment: Alignment.topLeft,child: Text(widget.title, style: GoogleFonts.nunito(color: colors.primaryTextColor, fontSize: 17),)),
          ),
          GestureDetector(
            onTap: (){_selectTime(context);},
            child: Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Card(
                color: colors.textBoxColor,
                child: Padding(
                  padding: const EdgeInsets.only(top: 10.0, bottom: 10.0, left: 20.0, right: 20.0),
                  child: Text(
                    "${selectedTime.hourOfPeriod}:${selectedTime.minute} ${selectedTime.period}",
                    style: GoogleFonts.nunito(
                        color: colors.primaryTextColor,
                        fontSize: 20,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  _selectTime(BuildContext context) async {
    final TimeOfDay? timeOfDay = await showTimePicker(
      context: context,
      initialTime: selectedTime,
      initialEntryMode: TimePickerEntryMode.dial,
    );
    if (timeOfDay != null && timeOfDay != selectedTime) {
      setState(() {
        selectedTime = timeOfDay;
      });
    }
  }
}
