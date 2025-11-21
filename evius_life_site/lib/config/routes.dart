import 'package:flutter/material.dart';
import '../pages/contact.dart';
import '../pages/privacy_policy.dart';
import '../pages/terms_coditions.dart';
import '../screens/home_page.dart';

/// Application routes configuration
class AppRoutes {
  AppRoutes._();

  static const String home = '/';
  static const String contact = '/contact';
  static const String privacyPolicy = '/privacy-policy';
  static const String termsConditions = '/terms-conditions';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case home:
        return MaterialPageRoute(builder: (_) => const HomePage());
      case contact:
        return MaterialPageRoute(builder: (_) => const ContactPage());
      case privacyPolicy:
        return MaterialPageRoute(builder: (_) => const PrivacyPolicyPage());
      case termsConditions:
        return MaterialPageRoute(builder: (_) => const TermsConditionsPage());
      default:
        return MaterialPageRoute(builder: (_) => const HomePage());
    }
  }
}
