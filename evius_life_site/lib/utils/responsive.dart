import 'package:flutter/material.dart';
import '../config/constants.dart';

/// Responsive utility functions
class Responsive {
  Responsive._();

  /// Check if current screen is mobile
  static bool isMobile(BuildContext context) {
    return MediaQuery.of(context).size.width < AppConstants.mobileBreakpoint;
  }

  /// Check if current screen is tablet
  static bool isTablet(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return width >= AppConstants.mobileBreakpoint &&
        width < AppConstants.tabletBreakpoint;
  }

  /// Check if current screen is desktop
  static bool isDesktop(BuildContext context) {
    return MediaQuery.of(context).size.width >= AppConstants.tabletBreakpoint;
  }

  /// Get responsive value based on screen size
  static T value<T>({
    required BuildContext context,
    required T mobile,
    T? tablet,
    T? desktop,
  }) {
    if (isDesktop(context) && desktop != null) return desktop;
    if (isTablet(context) && tablet != null) return tablet;
    return mobile;
  }

  /// Get responsive padding
  static EdgeInsets padding(BuildContext context) {
    final horizontal = isMobile(context)
        ? AppConstants.spacingMD
        : AppConstants.spacingXXL;
    return EdgeInsets.symmetric(horizontal: horizontal);
  }

  /// Get responsive spacing
  static double spacing(
    BuildContext context, {
    double? mobile,
    double? tablet,
    double? desktop,
  }) {
    return value(
      context: context,
      mobile: mobile ?? AppConstants.spacingMD,
      tablet: tablet,
      desktop: desktop,
    );
  }
}
