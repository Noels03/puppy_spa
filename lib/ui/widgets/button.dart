import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:puppy_spa/ui/theme.dart';

class AppLog extends StatelessWidget {
  final String label;
  final Function()? onTap;
  const AppLog({Key? key, required this.label, required this.onTap}) : super(key: key);
  
  get color => null;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 100,
        height: 60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), 
          color: mainClr
        ),
        child: Container(
          margin:  const EdgeInsets.only(top: 15),
          child: Text(
          label,
          textAlign: TextAlign.center,
          style: GoogleFonts.vollkorn(textStyle: TextStyle(
            color: Colors.white,),
          ),
        ),
      ),
    ));
  }
}
