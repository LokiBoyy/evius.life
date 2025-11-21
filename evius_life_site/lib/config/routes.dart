import 'package:flutter/material.dart';
import '../pages/contact.dart';
import '../pages/privacy_policy.dart';
import '../pages/terms_coditions.dart';
import '../screens/home_page.dart';
import '../utils/seo_service.dart';

/// Application routes configuration
class AppRoutes {
  AppRoutes._();

  static const String home = '/';
  static const String contact = '/contact';
  static const String privacyPolicy = '/privacy-policy';
  static const String termsConditions = '/terms-conditions';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    // Set SEO meta tags based on route
    switch (settings.name) {
      case home:
        SeoService.setHomePageMeta();
        return MaterialPageRoute(builder: (_) => const HomePage());
      case contact:
        SeoService.setContactPageMeta();
        return MaterialPageRoute(builder: (_) => const ContactPage());
      case privacyPolicy:
        SeoService.setPrivacyPolicyMeta();
        return MaterialPageRoute(builder: (_) => const PrivacyPolicyPage());
      case termsConditions:
        SeoService.setTermsConditionsMeta();
        return MaterialPageRoute(builder: (_) => const TermsConditionsPage());
      default:
        SeoService.setHomePageMeta();
        return MaterialPageRoute(builder: (_) => const HomePage());
    }
  }
}
