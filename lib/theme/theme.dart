import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// Color

// Primary
Color primary10 = const Color(0xFFCCE8E8);
Color primary30 = const Color(0xFF66BABA);
Color primary50 = const Color(0xFF008C8C);
Color primary70 = const Color(0xFF007070);
Color primary90 = const Color(0xFF004646);

// Secondary
Color secondary10 = const Color(0xFFF3E5DD);
Color secondary30 = const Color(0xFF9297A9);
Color secondary50 = const Color(0xFF49516F);
Color secondary70 = const Color(0xFF3A4159);
Color secondary90 = const Color(0xFF252938);

// Accent
Color accent10 = const Color(0xFFF3E5DD);
Color accent30 = const Color(0xFFD6A389);
Color accent50 = const Color(0xFFC57B57);
Color accent70 = const Color(0xFF8A563D);
Color accent90 = const Color(0xFF633E2C);

// Neutral
Color black = const Color(0xFF000000);
Color gray = const Color(0xFFB3B3B3);
Color white = const Color(0xFFFFFFFF);

// Fonts

// Headings
TextStyle headings(String headerLevel, [Color? colorCode]) {
  colorCode ??= black;
  Map levels = {"h1": 40, "h2": 32, "h3": 24, "h4": 20, "h5": 16, "h6": 14};
  return GoogleFonts.inter(
    fontWeight: FontWeight.w700,
    fontSize: levels[headerLevel],
    color: colorCode,
  );
}

// Title
TextStyle title(String headerLevel, [Color? colorCode]) {
  colorCode ??= black;
  Map levels = {"t1": 24, "t2": 20};
  return GoogleFonts.inter(
    fontWeight: FontWeight.w600,
    fontSize: levels[headerLevel],
    color: colorCode,
  );
}

// Subtitle
TextStyle subTitle(String headerLevel, [Color? colorCode]) {
  colorCode ??= black;
  Map levels = {"st1": 20, "st2": 16};
  return GoogleFonts.inter(
    fontWeight: FontWeight.w500,
    fontSize: levels[headerLevel],
    color: colorCode,
  );
}

// Body
TextStyle body(String headerLevel, [Color? colorCode]) {
  colorCode ??= black;
  Map levels = {"b1": 16, "b2": 14};
  return GoogleFonts.inter(
    fontWeight: FontWeight.w400,
    fontSize: levels[headerLevel],
    color: colorCode,
  );
}



// TextStyle heading1 = GoogleFonts.inter(
//   fontWeight: FontWeight.w700,
//   fontSize: 40,
//   color: black,
// );

// TextStyle heading2 = GoogleFonts.inter(
//   fontWeight: FontWeight.w700,
//   fontSize: 32,
//   color: black,
// );

// TextStyle heading3 = GoogleFonts.inter(
//   fontWeight: FontWeight.w700,
//   fontSize: 24,
//   color: black,
// );

// TextStyle heading4 = GoogleFonts.inter(
//   fontWeight: FontWeight.w700,
//   fontSize: 20,
//   color: black,
// );

// TextStyle heading5 = GoogleFonts.inter(
//   fontWeight: FontWeight.w700,
//   fontSize: 16,
//   color: black,
// );

// TextStyle heading6 = GoogleFonts.inter(
//   fontWeight: FontWeight.w700,
//   fontSize: 14,
//   color: black,
// );
