// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wiseki_note_app/src/constants/colors.dart';

mixin AppStyleSourceSerif4 {
  static TextStyle kFontW3 = GoogleFonts.sourceSerif4(
    fontWeight: FontWeight.w300,
    color: kBlack,
    fontSize: 20,
  );

  static TextStyle kFontW4 = GoogleFonts.sourceSerif4(
    fontWeight: FontWeight.w400,
    color: kBlack,
    fontSize: 20,
  );

  static TextStyle kFontW5 = GoogleFonts.sourceSerif4(
    fontWeight: FontWeight.w500,
    color: kBlack,
    fontSize: 20,
  );

  static TextStyle kFontW6 = GoogleFonts.sourceSerif4(
    color: kBlack,
    fontSize: 20,
    fontWeight: FontWeight.w600,
  );

  static TextStyle kFontW7 = GoogleFonts.sourceSerif4(
    color: kBlack,
    fontSize: 20,
    fontWeight: FontWeight.w700,
  );
}
