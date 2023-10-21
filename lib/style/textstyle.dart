import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

TextStyle appstyle(
    {required Color color, required double size, required FontWeight ff}) {
  return GoogleFonts.lato(
      textStyle: TextStyle(
    color: color,
    fontSize: size,
    fontWeight: ff,
  ));
}
