import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomLabels {

  static TextStyle h1 = GoogleFonts.montserrat(
    fontSize: 25,
    fontWeight: FontWeight.bold,
    color: Colors.purple
  );

  static TextStyle h2 = GoogleFonts.montserrat(
    fontSize: 20,
    fontWeight: FontWeight.w400
  );

  static TextStyle normal = GoogleFonts.montserrat();

  static TextStyle h1White = GoogleFonts.montserrat(
    fontSize: 25,
    fontWeight: FontWeight.bold,
    color: Colors.white
  );

  static TextStyle h1BoldWhite = GoogleFonts.montserrat(
    fontSize: 25,
    color: Colors.white
  );

}