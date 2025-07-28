import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextStyles {
  static final TextStyle regular = GoogleFonts.nunito(
    fontWeight: FontWeight.w400,
    fontSize: 14,
    color: Colors.black,
  );

  static final TextStyle medium = GoogleFonts.nunito(
    fontWeight: FontWeight.w500,
    fontSize: 16,
    color: Colors.black,
  );

  static final TextStyle semiBold = GoogleFonts.nunito(
    fontWeight: FontWeight.w600,
    fontSize: 18,
    color: Colors.black,
  );

  static final TextStyle bold = GoogleFonts.nunito(
    fontWeight: FontWeight.w700,
    fontSize: 20,
    color: Colors.black,
  );
}
