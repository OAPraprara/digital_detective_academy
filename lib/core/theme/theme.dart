import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  // Brand color tokens from the Modern Noir Design System
  static const Color baseBackground = Color(0xFF111318);
  static const Color surfaceLayer = Color(0xFF1E2024);
  static const Color neonOrange = Color(0xFFFF6800);
  static const Color neonCyan = Color(0xFF00EEFC);
  static const Color terminalGreen = Color(0xFF1FB000);
  static const Color textPrimary = Color(0xFFE2E2E8);
  static const Color textSecondary = Color(0xFF8E90A6);

  static ThemeData get darkTheme {
    final baseTextTheme = ThemeData.dark().textTheme;

    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      primaryColor: neonOrange,
      scaffoldBackgroundColor: baseBackground,
      colorScheme: const ColorScheme.dark(
        primary: neonOrange,
        secondary: neonCyan,
        tertiary: terminalGreen,
        surface: baseBackground,
        onPrimary: Colors.black,
        onSecondary: Colors.black,
        onSurface: textPrimary,
        error: Colors.redAccent,
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: baseBackground,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: TextStyle(
          color: textPrimary,
          fontSize: 20,
          fontWeight: FontWeight.bold,
          letterSpacing: 0.8,
        ),
        iconTheme: IconThemeData(color: neonOrange),
      ),
      cardTheme: const CardThemeData(
        color: surfaceLayer,
        elevation: 0,
        margin: EdgeInsets.symmetric(vertical: 8),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(12)),
          side: BorderSide(
            color: Color(0xFF333539), // Subtle border to match modern noir aesthetic
            width: 1,
          ),
        ),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: surfaceLayer,
        selectedItemColor: neonOrange,
        unselectedItemColor: textSecondary,
        elevation: 8,
        type: BottomNavigationBarType.fixed,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: neonOrange,
          foregroundColor: Colors.black,
          elevation: 0,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
      textTheme: TextTheme(
        // Display - Space Grotesk
        displayLarge: GoogleFonts.spaceGrotesk(textStyle: baseTextTheme.displayLarge),
        displayMedium: GoogleFonts.spaceGrotesk(textStyle: baseTextTheme.displayMedium),
        displaySmall: GoogleFonts.spaceGrotesk(textStyle: baseTextTheme.displaySmall),
        
        // Headline - Space Grotesk
        headlineLarge: GoogleFonts.spaceGrotesk(textStyle: baseTextTheme.headlineLarge),
        headlineMedium: GoogleFonts.spaceGrotesk(textStyle: baseTextTheme.headlineMedium),
        headlineSmall: GoogleFonts.spaceGrotesk(textStyle: baseTextTheme.headlineSmall),
        
        // Title - Space Grotesk
        titleLarge: GoogleFonts.spaceGrotesk(textStyle: baseTextTheme.titleLarge),
        titleMedium: GoogleFonts.spaceGrotesk(textStyle: baseTextTheme.titleMedium),
        titleSmall: GoogleFonts.spaceGrotesk(textStyle: baseTextTheme.titleSmall),
        
        // Body - JetBrains Mono
        bodyLarge: GoogleFonts.jetBrainsMono(textStyle: baseTextTheme.bodyLarge),
        bodyMedium: GoogleFonts.jetBrainsMono(textStyle: baseTextTheme.bodyMedium),
        bodySmall: GoogleFonts.jetBrainsMono(textStyle: baseTextTheme.bodySmall),
        
        // Label - JetBrains Mono
        labelLarge: GoogleFonts.jetBrainsMono(textStyle: baseTextTheme.labelLarge),
        labelMedium: GoogleFonts.jetBrainsMono(textStyle: baseTextTheme.labelMedium),
        labelSmall: GoogleFonts.jetBrainsMono(textStyle: baseTextTheme.labelSmall),
      ),
    );
  }
}
