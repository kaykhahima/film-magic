import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// The [AppTheme] defines light and dark themes for the app.
///
/// Theme setup for FlexColorScheme package v8.
/// Use same major flex_color_scheme package version. If you use a
/// lower minor version, some properties may not be supported.
/// In that case, remove them after copying this theme to your
/// app or upgrade the package to version 8.2.0.
///
/// Use it in a [MaterialApp] like this:
///
/// MaterialApp(
///   theme: AppTheme.light,
///   darkTheme: AppTheme.dark,
/// );
abstract final class AppTheme {
  // The FlexColorScheme defined light mode ThemeData.
  static ThemeData light = FlexThemeData.light(
    // User defined custom colors made with FlexSchemeColor() API.
    colors: const FlexSchemeColor(
      primary: Color(0xFF8E00FE),
      primaryContainer: Color(0xFF8E00FE),
      secondary: Color(0xFFF3F4F6),
      secondaryContainer: Color(0xFFF3F4F6),
      tertiary: Color(0xFFF3F4F6),
      tertiaryContainer: Color(0xFFF3F4F6),
      appBarColor: Color(0xFFF3F4F6),
      error: Color(0xFFEF4444),
      errorContainer: Color(0xFFFFDAD6),
    ),
    // Surface color adjustments.
    surfaceTint: const Color(0xFF8E00FE),
    // Convenience direct styling properties.
    appBarStyle: FlexAppBarStyle.surface,
    // Component theme configurations for light mode.
    subThemesData: const FlexSubThemesData(
      interactionEffects: true,
      tintedDisabledControls: true,
      useM2StyleDividerInM3: true,
      outlinedButtonOutlineSchemeColor: SchemeColor.primary,
      switchThumbSchemeColor: SchemeColor.onPrimary,
      inputDecoratorBorderType: FlexInputBorderType.outline,
      inputDecoratorRadius: 12.0,
      chipSelectedSchemeColor: SchemeColor.primary,
      chipSecondarySelectedSchemeColor: SchemeColor.primary,
      chipRadius: 12.0,
      alignedDropdown: true,
      appBarScrolledUnderElevation: 0.0,
      bottomNavigationBarBackgroundSchemeColor: SchemeColor.surface,
      bottomNavigationBarElevation: 0.0,
      bottomNavigationBarShowSelectedLabels: false,
      bottomNavigationBarShowUnselectedLabels: false,
      navigationRailUseIndicator: true,
    ),
    // Direct ThemeData properties.
    visualDensity: FlexColorScheme.comfortablePlatformDensity,
    cupertinoOverrideTheme: const CupertinoThemeData(applyThemeToAll: true),
  );

  // The FlexColorScheme defined dark mode ThemeData.
  static ThemeData dark = FlexThemeData.dark(
    // User defined custom colors made with FlexSchemeColor() API.
    colors: const FlexSchemeColor(
      primary: Color(0xFF6200AF),
      primaryContainer: Color(0xFF6200AF),
      primaryLightRef: Color(0xFF8E00FE), // The color of light mode primary
      secondary: Color(0xFF1F2937),
      secondaryContainer: Color(0xFF1F2937),
      secondaryLightRef: Color(0xFFF3F4F6), // The color of light mode secondary
      tertiary: Color(0xFF1F2937),
      tertiaryContainer: Color(0xFF1F2937),
      tertiaryLightRef: Color(0xFFF3F4F6), // The color of light mode tertiary
      appBarColor: Color(0xFFF3F4F6),
      error: Color(0xFF7F1D1D),
      errorContainer: Color(0xFF93000A),
    ),
    // Convenience direct styling properties.
    appBarStyle: FlexAppBarStyle.surface,
    // Component theme configurations for dark mode.
    subThemesData: const FlexSubThemesData(
      interactionEffects: true,
      tintedDisabledControls: true,
      useM2StyleDividerInM3: true,
      outlinedButtonOutlineSchemeColor: SchemeColor.primary,
      switchThumbSchemeColor: SchemeColor.onPrimary,
      inputDecoratorBorderType: FlexInputBorderType.outline,
      inputDecoratorRadius: 12.0,
      chipSelectedSchemeColor: SchemeColor.primary,
      chipSecondarySelectedSchemeColor: SchemeColor.primary,
      chipRadius: 12.0,
      alignedDropdown: true,
      appBarScrolledUnderElevation: 0.0,
      bottomNavigationBarBackgroundSchemeColor: SchemeColor.surface,
      bottomNavigationBarElevation: 0.0,
      bottomNavigationBarShowSelectedLabels: false,
      bottomNavigationBarShowUnselectedLabels: false,
      navigationRailUseIndicator: true,
    ),
    // Direct ThemeData properties.
    visualDensity: FlexColorScheme.comfortablePlatformDensity,
    cupertinoOverrideTheme: const CupertinoThemeData(applyThemeToAll: true),
  );
}
