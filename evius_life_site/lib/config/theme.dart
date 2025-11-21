import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'constants.dart';

/// Application theme configuration
class AppTheme {
  AppTheme._();

  static const Color neonAmber = Color(AppConstants.neonAmber);
  static const Color electricCyan = Color(AppConstants.electricCyan);
  static const Color darkSurface = Color(AppConstants.darkSurface);
  static const Color darkBackground = Color(AppConstants.darkBackground);

  static ThemeData get darkTheme {
    final colorScheme = _buildColorScheme();

    return ThemeData(
      useMaterial3: true,
      colorScheme: colorScheme,
      scaffoldBackgroundColor: darkBackground,
      textTheme: GoogleFonts.poppinsTextTheme(
        Typography.whiteCupertino.apply(
          displayColor: Colors.white,
          bodyColor: Colors.white70,
        ),
      ),
      cardTheme: CardThemeData(
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppConstants.radiusLG),
        ),
        color: colorScheme.surfaceContainer,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(
            horizontal: AppConstants.spacingLG,
            vertical: AppConstants.spacingMD,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppConstants.radiusMD),
          ),
        ),
      ),
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          padding: const EdgeInsets.symmetric(
            horizontal: AppConstants.spacingLG,
            vertical: AppConstants.spacingMD,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppConstants.radiusMD),
          ),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          padding: const EdgeInsets.symmetric(
            horizontal: AppConstants.spacingLG,
            vertical: AppConstants.spacingMD,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppConstants.radiusMD),
          ),
        ),
      ),
      chipTheme: ChipThemeData(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppConstants.radiusSM),
        ),
      ),
    );
  }

  static ColorScheme _buildColorScheme() {
    return ColorScheme.fromSeed(
      seedColor: neonAmber,
      brightness: Brightness.dark,
    ).copyWith(
      primary: neonAmber,
      onPrimary: Colors.black,
      primaryContainer: neonAmber.withValues(alpha: 0.2),
      onPrimaryContainer: neonAmber,
      secondary: electricCyan,
      onSecondary: Colors.black,
      secondaryContainer: electricCyan.withValues(alpha: 0.2),
      onSecondaryContainer: electricCyan,
      tertiary: electricCyan,
      onTertiary: Colors.black,
      tertiaryContainer: electricCyan.withValues(alpha: 0.2),
      onTertiaryContainer: electricCyan,
      surface: darkSurface,
      onSurface: Colors.white,
      surfaceContainerHighest: const Color(0xFF1A1D2A),
      surfaceContainer: const Color(0xFF11182A),
      surfaceContainerLow: darkSurface,
      surfaceContainerLowest: darkBackground,
      outline: Colors.white.withValues(alpha: 0.12),
      outlineVariant: Colors.white.withValues(alpha: 0.08),
      shadow: Colors.black,
      scrim: Colors.black,
      inverseSurface: Colors.white,
      onInverseSurface: Colors.black,
      inversePrimary: electricCyan,
      surfaceTint: Colors.transparent,
    );
  }
}
