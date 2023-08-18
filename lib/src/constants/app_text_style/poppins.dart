// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wiseki_note_app/src/constants/colors.dart';

mixin AppStylePoppins {
  static TextStyle kFontW4 = GoogleFonts.poppins(
    fontWeight: FontWeight.w400,
    color: kBlack,
    fontSize: 20,
  );

  static TextStyle kFontW5 = GoogleFonts.poppins(
    fontWeight: FontWeight.w500,
    color: kBlack,
    fontSize: 20,
  );

  static TextStyle kFontW6 = GoogleFonts.poppins(
    color: kBlack,
    fontSize: 20,
    fontWeight: FontWeight.w600,
  );

  static TextStyle kFontW7 = GoogleFonts.poppins(
    color: kBlack,
    fontSize: 20,
    fontWeight: FontWeight.w700,
  );
}
