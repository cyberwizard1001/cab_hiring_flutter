import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cab_hiring_flutter/utils/colors.dart' as colors;


class FancyButton extends StatefulWidget {
  const FancyButton({Key? key, required this.title, required this.icon}) : super(key: key);
  final title;
  final IconData icon;

  @override
  State<FancyButton> createState() => _FancyButtonState();
}

class _FancyButtonState extends State<FancyButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: SizedBox(
        height: 80,
        width: 80,
        child: Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(widget.icon),
                  const SizedBox(height: 5.0,),
                  Text(widget.title, textAlign: TextAlign.center,)
                ],
              ),
            ),
          ),
        ),
    );
  }
}
