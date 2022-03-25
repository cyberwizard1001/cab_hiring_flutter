import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cab_hiring_flutter/utils/colors.dart' as colors;
import 'package:flutter_rounded_date_picker/flutter_rounded_date_picker.dart';
import 'package:google_fonts/google_fonts.dart';

class DatePickerWidget extends FormField<DateTime> {
  DatePickerWidget(
      {FormFieldSetter<DateTime>? onSaved,
        FormFieldValidator<DateTime>? validator,
        DateTime? defaultDate,
        required context,
        hint = 'Please choose a date',
        title,
        AutovalidateMode autoValidateMode = AutovalidateMode.disabled})
      : super(
      onSaved: onSaved,
      validator: validator ??
              (data) {
            if (data == null) return "Please choose date";
            return null;
          },
      initialValue: defaultDate ?? null,
      autovalidateMode: autoValidateMode,
      builder: (FormFieldState<DateTime> state) {
        Future pickDate(BuildContext context) async {
          await CupertinoRoundedDatePicker.show(context,
              background: colors.textBoxColor,
              textColor: colors.textBoxTextColor,
              initialDate: state.value ?? DateTime.now(),
              minimumYear: 1900,
              maximumDate: DateTime.now(),
              maximumYear: DateTime.now().year,
              initialDatePickerMode: CupertinoDatePickerMode.date,
              borderRadius: 16, onDateTimeChanged: (date) {
                state.didChange(date);
              });
        }

        return Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: 8),
                child: Text(title ?? 'Choose date',
                    style: GoogleFonts.montserrat(
                        fontSize: 15, color: Colors.white)),
              ),
              Card(
                color: colors.scaffoldColor,
                elevation: 6,
                margin: EdgeInsets.only(bottom: 4),
                child: InkWell(
                  onTap: () {
                    pickDate(context);
                  },
                  child: Padding(
                    padding: EdgeInsets.only(
                        left: 8, right: 8, top: 15, bottom: 15),
                    child: Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(right: 20, left: 10),
                          child: Icon(
                            Icons.calendar_today,
                            color: colors.primaryTextColor,
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Text(
                              state.value == null
                                  ? hint
                                  : '${state.value!.day} / ${state.value!.month} / ${state.value!.year}',
                              style: GoogleFonts.montserrat(
                                  fontSize: 15,
                                  color: state.hasError
                                      ? colors.errorColor
                                      : Colors.grey)),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              state.hasError
                  ? Container(
                padding: EdgeInsets.all(7),
                child: Text(
                  state.errorText ?? "error",
                  style: TextStyle(
                      color: colors.errorColor, fontSize: 10),
                ),
              )
                  : Container()
            ],
          ),
        );
      });
}
