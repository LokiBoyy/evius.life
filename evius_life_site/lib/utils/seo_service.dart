import 'package:flutter/foundation.dart';
import 'dart:html' as html;

/// SEO service for managing meta tags and SEO optimization
class SeoService {
  SeoService._();

  static const String baseUrl = 'https://evius.life';
  static const String siteName = 'evius.life';
  static const String defaultImage = '$baseUrl/icons/Icon-512.png';

  /// Set SEO meta tags for a page
  static void setPageMeta({
    required String title,
    required String description,
    String? keywords,
    String? image,
    String? url,
    String? type,
  }) {
    if (!kIsWeb) return;

    final pageUrl = url ?? baseUrl;
    final pageImage = image ?? defaultImage;
    final pageType = type ?? 'website';

    // Update document title
    html.document.title = title;

    // Update or create meta tags using DOM manipulation
    _setMetaTag('name', 'description', description);
    if (keywords != null) {
      _setMetaTag('name', 'keywords', keywords);
    }
    _setMetaTag('name', 'author', 'Lokesh Upputri');

    // Open Graph tags
    _setMetaTag('property', 'og:title', title);
    _setMetaTag('property', 'og:description', description);
    _setMetaTag('property', 'og:image', pageImage);
    _setMetaTag('property', 'og:url', pageUrl);
    _setMetaTag('property', 'og:type', pageType);
    _setMetaTag('property', 'og:site_name', siteName);
  }

  /// Helper method to set meta tags
  static void _setMetaTag(String attribute, String value, String content) {
    if (!kIsWeb) return;

    final meta = html.document.querySelector('meta[$attribute="$value"]')
        as html.MetaElement?;
    if (meta != null) {
      meta.content = content;
    } else {
      final newMeta = html.MetaElement()
        ..setAttribute(attribute, value)
        ..content = content;
      html.document.head?.append(newMeta);
    }
  }

  /// Set default/home page SEO
  static void setHomePageMeta() {
    setPageMeta(
      title: 'evius.life - Digital tools with intention',
      description:
          'Digital tools built slowly, with care. Creating intentional, beautiful, and privacy-focused applications that respect your attention.',
      keywords:
          'evius.life, digital tools, app development, privacy-focused apps, intentional design, beautiful software',
      url: baseUrl,
      type: 'website',
    );
  }

  /// Set contact page SEO
  static void setContactPageMeta() {
    setPageMeta(
      title: 'Contact - evius.life',
      description:
          'Get in touch with Lokesh Upputri, independent app developer building tools that respect your attention. Questions or feedback welcome.',
      keywords: 'contact, evius.life, app developer, Lokesh Upputri',
      url: '$baseUrl/contact',
      type: 'website',
    );
  }

  /// Set privacy policy page SEO
  static void setPrivacyPolicyMeta() {
    setPageMeta(
      title: 'Privacy Policy - evius.life',
      description:
          'Privacy policy for evius.life. Learn how we protect your privacy and handle your data.',
      keywords: 'privacy policy, evius.life, data protection, privacy',
      url: '$baseUrl/privacy-policy',
      type: 'website',
    );
  }

  /// Set terms and conditions page SEO
  static void setTermsConditionsMeta() {
    setPageMeta(
      title: 'Terms and Conditions - evius.life',
      description:
          'Terms and conditions for using evius.life. Read our terms of service and usage guidelines.',
      keywords: 'terms and conditions, evius.life, terms of service',
      url: '$baseUrl/terms-conditions',
      type: 'website',
    );
  }
}
