import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  // Brand Colors mapped from Tailwind config
  static const Color background = Color(0xFFFAFAF5);
  static const Color onBackground = Color(0xFF1A1C19);
  static const Color primary = Color(0xFF00322A);
  static const Color onPrimary = Color(0xFFFFFFFF);
  static const Color surface = Color(0xFFFAFAF5);
  static const Color surfaceContainerHighest = Color(0xFFE3E3DE);
  static const Color error = Color(0xFFBA1A1A);
  
  static const Color tertiary = Color(0xFF735C00);
  
  // Gradients
  static const LinearGradient editorialGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0xFF00322A),
      Color(0xFF1A1C19),
    ],
  );

  static final ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: background,
    colorScheme: const ColorScheme.light(
      primary: primary,
      onPrimary: onPrimary,
      surface: surface,
      onSurface: onBackground,
      error: error,
    ),
    textTheme: TextTheme(
      displayLarge: GoogleFonts.notoSerif(
        fontSize: 57,
        fontWeight: FontWeight.bold,
        color: onBackground,
      ),
      displayMedium: GoogleFonts.notoSerif(
        fontSize: 45,
        fontWeight: FontWeight.bold,
        color: onBackground,
      ),
      headlineLarge: GoogleFonts.notoSerif(
        fontSize: 32,
        fontWeight: FontWeight.bold,
        color: onBackground,
      ),
      headlineMedium: GoogleFonts.notoSerif(
        fontSize: 28,
        fontWeight: FontWeight.w600,
        color: onBackground,
      ),
      titleLarge: GoogleFonts.inter(
        fontSize: 22,
        fontWeight: FontWeight.w600,
        color: onBackground,
      ),
      bodyLarge: GoogleFonts.inter(
        fontSize: 16,
        color: onBackground,
      ),
      bodyMedium: GoogleFonts.inter(
        fontSize: 14,
        color: onBackground,
      ),
      labelLarge: GoogleFonts.inter(
        fontSize: 14,
        fontWeight: FontWeight.w600,
        color: onPrimary,
        letterSpacing: 1.5,
      ),
      labelSmall: GoogleFonts.inter(
        fontSize: 10,
        fontWeight: FontWeight.w400,
        letterSpacing: 2.0,
      ),
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: true,
      iconTheme: IconThemeData(color: onBackground),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: primary,
        foregroundColor: onPrimary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
        elevation: 0,
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: primary,
        side: const BorderSide(color: primary),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: primary,
        textStyle: GoogleFonts.inter(fontWeight: FontWeight.w600),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: surfaceContainerHighest.withValues(alpha: 0.3),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: surfaceContainerHighest),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: surfaceContainerHighest),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: primary),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: error),
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      labelStyle: const TextStyle(color: Color(0xFF5D5F60)),
    ),
    cardTheme: CardThemeData(
      color: surface,
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
    ),
  );
}
