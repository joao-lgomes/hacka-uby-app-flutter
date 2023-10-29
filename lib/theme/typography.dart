import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: constant_identifier_names
const PRIMARY_FONT = 'Montserrat';

class UbyFonts {
  UbyFonts._();
  static const primaryFont = PRIMARY_FONT;
}
class UbyTypographyRegular {
  UbyTypographyRegular._();
  static final display_2 = GoogleFonts.getFont(PRIMARY_FONT, fontSize: 31.1);
  static final display_1 = GoogleFonts.getFont(PRIMARY_FONT, fontSize: 25);
  static final headline = GoogleFonts.getFont(PRIMARY_FONT, fontSize: 23);
  static final title = GoogleFonts.getFont(PRIMARY_FONT, fontSize: 20);
  static final subheading_2 = GoogleFonts.getFont(PRIMARY_FONT, fontSize: 18);
  static final body_3 = GoogleFonts.getFont(PRIMARY_FONT, fontSize: 16);
  static final body_2 = GoogleFonts.getFont(PRIMARY_FONT, fontSize: 12.8);
  static final body_1 = GoogleFonts.getFont(PRIMARY_FONT, fontSize: 10.2);
}

class UbyTypographyMedium {
  UbyTypographyMedium._();
  static final display_2 = GoogleFonts.getFont(PRIMARY_FONT,
      fontSize: 31.1, fontWeight: FontWeight.w500);
  static final display_1 = GoogleFonts.getFont(PRIMARY_FONT,
      fontSize: 25, fontWeight: FontWeight.w500);
  static final headline = GoogleFonts.getFont(PRIMARY_FONT,
      fontSize: 23, fontWeight: FontWeight.w500);
  static final title = GoogleFonts.getFont(PRIMARY_FONT,
      fontSize: 20, fontWeight: FontWeight.w500);
  static final subheading_2 = GoogleFonts.getFont(PRIMARY_FONT,
      fontSize: 18, fontWeight: FontWeight.w500);
  static final body_3 = GoogleFonts.getFont(PRIMARY_FONT,
      fontSize: 16, fontWeight: FontWeight.w500);
  static final body_2 = GoogleFonts.getFont(PRIMARY_FONT,
      fontSize: 12.8, fontWeight: FontWeight.w500);
  static final body_1 = GoogleFonts.getFont(PRIMARY_FONT,
      fontSize: 10.2, fontWeight: FontWeight.w500);
}

class UbyTypographySemiBold {
  UbyTypographySemiBold._();
  static final display_2 = GoogleFonts.getFont(PRIMARY_FONT,
      fontSize: 31.1, fontWeight: FontWeight.w600);
  static final display_1 = GoogleFonts.getFont(PRIMARY_FONT,
      fontSize: 25, fontWeight: FontWeight.w600);
  static final headline = GoogleFonts.getFont(PRIMARY_FONT,
      fontSize: 23, fontWeight: FontWeight.w600);
  static final title = GoogleFonts.getFont(PRIMARY_FONT,
      fontSize: 20, fontWeight: FontWeight.w600);
  static final subheading_2 = GoogleFonts.getFont(PRIMARY_FONT,
      fontSize: 18, fontWeight: FontWeight.w600);
  static final body_3 = GoogleFonts.getFont(PRIMARY_FONT,
      fontSize: 16, fontWeight: FontWeight.w600);
  static final body_2 = GoogleFonts.getFont(PRIMARY_FONT,
      fontSize: 12.8, fontWeight: FontWeight.w600);
  static final body_1 = GoogleFonts.getFont(PRIMARY_FONT,
      fontSize: 10.2, fontWeight: FontWeight.w600);
}