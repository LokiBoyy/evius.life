import 'package:flutter/foundation.dart';
import 'dart:html' as html;
import 'dart:convert';

/// SEO service for managing meta tags and SEO optimization
class SeoService {
  SeoService._();

  static const String baseUrl = 'https://evius.life';
  static const String siteName = 'evius.life';
  static const String defaultImage = '$baseUrl/icons/Icon-512.png';
  static const String authorName = 'Lokesh Upputri';
  static const String twitterHandle = '@eviuslife';
  static const String locale = 'en_US';

  /// Set SEO meta tags for a page
  static void setPageMeta({
    required String title,
    required String description,
    String? keywords,
    String? image,
    String? url,
    String? type,
    String? twitterCard,
    int? imageWidth,
    int? imageHeight,
    String? author,
    bool? robotsIndex,
    String? canonicalUrl,
  }) {
    if (!kIsWeb) return;

    final pageUrl = url ?? baseUrl;
    final pageImage = image ?? defaultImage;
    final pageType = type ?? 'website';
    final cardType = twitterCard ?? 'summary_large_image';
    final pageAuthor = author ?? authorName;
    final shouldIndex = robotsIndex ?? true;
    final canonical = canonicalUrl ?? pageUrl;

    // Update document title
    html.document.title = title;

    // Basic meta tags
    _setMetaTag('name', 'description', description);
    if (keywords != null) {
      _setMetaTag('name', 'keywords', keywords);
    }
    _setMetaTag('name', 'author', pageAuthor);
    _setMetaTag('name', 'theme-color', '#0B0D16');
    _setMetaTag(
        'name', 'robots', shouldIndex ? 'index, follow' : 'noindex, nofollow');
    _setMetaTag('name', 'language', 'English');

    // Canonical URL
    _setLinkTag('rel', 'canonical', canonical);

    // Open Graph tags
    _setMetaTag('property', 'og:title', title);
    _setMetaTag('property', 'og:description', description);
    _setMetaTag('property', 'og:image', pageImage);
    _setMetaTag('property', 'og:url', pageUrl);
    _setMetaTag('property', 'og:type', pageType);
    _setMetaTag('property', 'og:site_name', siteName);
    _setMetaTag('property', 'og:locale', locale);
    if (imageWidth != null) {
      _setMetaTag('property', 'og:image:width', imageWidth.toString());
    }
    if (imageHeight != null) {
      _setMetaTag('property', 'og:image:height', imageHeight.toString());
    }

    // Twitter Card tags
    _setMetaTag('name', 'twitter:card', cardType);
    _setMetaTag('name', 'twitter:title', title);
    _setMetaTag('name', 'twitter:description', description);
    _setMetaTag('name', 'twitter:image', pageImage);
    _setMetaTag('name', 'twitter:site', twitterHandle);
    _setMetaTag('name', 'twitter:creator', twitterHandle);
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

  /// Helper method to set link tags (e.g., canonical)
  static void _setLinkTag(String attribute, String value, String href) {
    if (!kIsWeb) return;

    final link = html.document.querySelector('link[$attribute="$value"]')
        as html.LinkElement?;
    if (link != null) {
      link.href = href;
    } else {
      final newLink = html.LinkElement()
        ..setAttribute(attribute, value)
        ..href = href;
      html.document.head?.append(newLink);
    }
  }

  /// Set semantic H1 heading for SEO (hidden but readable by search engines)
  static void setH1Heading(String text) {
    if (!kIsWeb) return;

    // Remove existing SEO headings
    final existingH1 = html.document.querySelector('#seo-h1');
    existingH1?.remove();

    // Create hidden H1 for SEO
    final h1 = html.HeadingElement.h1()
      ..id = 'seo-h1'
      ..text = text
      ..style.display = 'none'
      ..setAttribute('aria-hidden', 'true');
    html.document.body?.insertAdjacentElement('afterBegin', h1);
  }

  /// Set semantic H2 headings for SEO (hidden but readable by search engines)
  static void setH2Headings(List<String> headings) {
    if (!kIsWeb) return;

    // Remove existing SEO H2s
    final existingH2s = html.document.querySelectorAll('#seo-headings h2');
    for (var h2 in existingH2s) {
      h2.remove();
    }

    // Create container for SEO headings if it doesn't exist
    var container =
        html.document.querySelector('#seo-headings') as html.DivElement?;
    if (container == null) {
      container = html.DivElement()
        ..id = 'seo-headings'
        ..style.display = 'none'
        ..setAttribute('aria-hidden', 'true');
      html.document.body?.insertAdjacentElement('afterBegin', container);
    }

    // Add H2 headings
    for (var heading in headings) {
      final h2 = html.HeadingElement.h2()..text = heading;
      container.append(h2);
    }
  }

  /// Set JSON-LD structured data
  static void setJsonLd(Map<String, dynamic> jsonLd) {
    if (!kIsWeb) return;

    // Remove existing JSON-LD script
    final existingScript = html.document.querySelector('#json-ld');
    existingScript?.remove();

    // Create new JSON-LD script with properly encoded JSON
    final script = html.ScriptElement()
      ..id = 'json-ld'
      ..type = 'application/ld+json'
      ..text = jsonEncode(jsonLd);
    html.document.head?.append(script);
  }

  /// Set Organization JSON-LD
  static void setOrganizationJsonLd({
    String? name,
    String? url,
    String? logo,
    String? description,
    String? email,
    String? address,
  }) {
    final org = {
      '@context': 'https://schema.org',
      '@type': 'Organization',
      'name': name ?? siteName,
      'url': url ?? baseUrl,
      'logo': logo ?? defaultImage,
      if (description != null) 'description': description,
      if (email != null) 'email': email,
      if (address != null)
        'address': {
          '@type': 'PostalAddress',
          'streetAddress': address,
        },
    };
    setJsonLd(org);
  }

  /// Set Website JSON-LD
  static void setWebsiteJsonLd({
    String? name,
    String? url,
    String? description,
    String? potentialAction,
  }) {
    final website = {
      '@context': 'https://schema.org',
      '@type': 'WebSite',
      'name': name ?? siteName,
      'url': url ?? baseUrl,
      if (description != null) 'description': description,
      if (potentialAction != null)
        'potentialAction': {
          '@type': 'SearchAction',
          'target': potentialAction,
          'query-input': 'required name=search_term_string',
        },
    };
    setJsonLd(website);
  }

  /// Set Person JSON-LD
  static void setPersonJsonLd({
    String? name,
    String? jobTitle,
    String? email,
    String? url,
    String? image,
  }) {
    final person = {
      '@context': 'https://schema.org',
      '@type': 'Person',
      'name': name ?? authorName,
      if (jobTitle != null) 'jobTitle': jobTitle,
      if (email != null) 'email': email,
      if (url != null) 'url': url,
      if (image != null) 'image': image,
    };
    setJsonLd(person);
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
      imageWidth: 512,
      imageHeight: 512,
    );

    // Set JSON-LD structured data
    setWebsiteJsonLd(
      name: siteName,
      url: baseUrl,
      description:
          'Digital tools built slowly, with care. Creating intentional, beautiful, and privacy-focused applications.',
    );
    setOrganizationJsonLd(
      name: siteName,
      url: baseUrl,
      logo: defaultImage,
      description: 'Digital tools built slowly, with care.',
      email: 'lu@evius.life',
    );

    // Set semantic headings with keywords
    setH1Heading('evius.life - Digital tools with intention');
    setH2Headings([
      'Digital tools built slowly with care',
      'Privacy-focused applications',
      'Intentional design and beautiful software',
      'What I\'m Building - Digital Tools',
    ]);
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
      imageWidth: 512,
      imageHeight: 512,
    );

    // Set Person JSON-LD for contact page
    setPersonJsonLd(
      name: authorName,
      jobTitle: 'Independent App Developer',
      email: 'lu@evius.life',
      url: baseUrl,
    );

    // Set semantic headings with keywords
    setH1Heading('Contact - evius.life App Developer');
    setH2Headings([
      'Contact Information',
      'Get in touch with Lokesh Upputri',
    ]);
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
      imageWidth: 512,
      imageHeight: 512,
    );

    // Set semantic headings with keywords
    setH1Heading('Privacy Policy - evius.life Data Protection');
    setH2Headings([
      'Privacy Policy',
      'Data Protection and Privacy',
    ]);
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
      imageWidth: 512,
      imageHeight: 512,
    );

    // Set semantic headings with keywords
    setH1Heading('Terms and Conditions - evius.life Terms of Service');
    setH2Headings([
      'Terms and Conditions',
      'Terms of Service',
    ]);
  }
}
