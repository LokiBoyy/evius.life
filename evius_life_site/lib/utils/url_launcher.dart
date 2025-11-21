import 'package:url_launcher/url_launcher.dart';

/// URL launcher utility functions
class UrlLauncher {
  UrlLauncher._();

  /// Launch an email client
  static Future<void> launchEmail(String email) async {
    final uri = Uri.parse('mailto:$email');
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  }

  /// Launch a URL in external browser
  static Future<void> launchUrlExternal(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }
}
