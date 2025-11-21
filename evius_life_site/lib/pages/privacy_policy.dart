import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../utils/responsive.dart';
import '../config/constants.dart';
import '../utils/seo_service.dart';

class PrivacyPolicyPage extends StatefulWidget {
  const PrivacyPolicyPage({super.key});

  @override
  State<PrivacyPolicyPage> createState() => _PrivacyPolicyPageState();
}

class _PrivacyPolicyPageState extends State<PrivacyPolicyPage> {
  String _content = '';
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    SeoService.setPrivacyPolicyMeta();
    _loadContent();
  }

  Future<void> _loadContent() async {
    try {
      final data = await rootBundle.loadString(AppConstants.privacyPolicyPath);
      setState(() {
        _content = data;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _content = 'Error loading privacy policy: $e';
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isMobile = Responsive.isMobile(context);

    return Scaffold(
      body: SizedBox.expand(
        child: Container(
          decoration: BoxDecoration(
            color: theme.colorScheme.surfaceContainerLowest,
          ),
          child: SafeArea(
            child: Column(
              children: [
                // Header
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: isMobile ? 24 : 48,
                    vertical: 16,
                  ),
                  child: Row(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.arrow_back),
                        onPressed: () => Navigator.of(context).pop(),
                        color: theme.colorScheme.onSurface,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        'Privacy Policy',
                        style: theme.textTheme.headlineSmall?.copyWith(
                          fontWeight: FontWeight.w600,
                          color: theme.colorScheme.onSurface,
                        ),
                      ),
                    ],
                  ),
                ),
                // Content
                Expanded(
                  child: _isLoading
                      ? Center(
                          child: CircularProgressIndicator(
                            color: theme.colorScheme.primary,
                          ),
                        )
                      : SingleChildScrollView(
                          padding: EdgeInsets.symmetric(
                            horizontal: isMobile ? 24 : 48,
                            vertical: 24,
                          ),
                          child: ConstrainedBox(
                            constraints: BoxConstraints(
                              maxWidth: isMobile ? double.infinity : 800,
                            ),
                            child: _buildContent(theme, isMobile),
                          ),
                        ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildContent(ThemeData theme, bool isMobile) {
    final lines = _content.split('\n');
    final widgets = <Widget>[];

    for (int i = 0; i < lines.length; i++) {
      final line = lines[i];
      final trimmed = line.trim();

      if (trimmed.isEmpty) {
        widgets.add(const SizedBox(height: 16));
        continue;
      }

      // H1
      if (trimmed.startsWith('# ')) {
        widgets.add(
          Padding(
            padding: const EdgeInsets.only(top: 32, bottom: 16),
            child: Text(
              trimmed.substring(2),
              style: theme.textTheme.headlineLarge?.copyWith(
                fontWeight: FontWeight.w700,
                color: theme.colorScheme.onSurface,
                fontSize: isMobile ? 28 : 36,
              ),
            ),
          ),
        );
      }
      // H2 (numbered sections)
      else if (RegExp(r'^\d+\)').hasMatch(trimmed)) {
        final match = RegExp(r'^(\d+)\)\s*\*\*(.+?)\*\*').firstMatch(trimmed);
        if (match != null) {
          widgets.add(
            Padding(
              padding: const EdgeInsets.only(top: 32, bottom: 12),
              child: Text(
                '${match.group(1)}) ${match.group(2)}',
                style: theme.textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                  color: theme.colorScheme.primary,
                  fontSize: isMobile ? 20 : 24,
                ),
              ),
            ),
          );
        } else {
          widgets.add(
            Padding(
              padding: const EdgeInsets.only(top: 24, bottom: 12),
              child: Text(
                trimmed,
                style: theme.textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.w600,
                  color: theme.colorScheme.onSurface,
                  fontSize: isMobile ? 18 : 22,
                ),
              ),
            ),
          );
        }
      }
      // H3 (subsections like 3.1, 3.2)
      else if (RegExp(r'^\d+\.\d+').hasMatch(trimmed)) {
        final match = RegExp(
          r'^(\d+\.\d+)\s*-\s*\*\*(.+?)\*\*',
        ).firstMatch(trimmed);
        if (match != null) {
          widgets.add(
            Padding(
              padding: const EdgeInsets.only(top: 24, bottom: 8),
              child: Text(
                '${match.group(1)} - ${match.group(2)}',
                style: theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                  color: theme.colorScheme.secondary,
                  fontSize: isMobile ? 17 : 20,
                ),
              ),
            ),
          );
        } else {
          widgets.add(
            Padding(
              padding: const EdgeInsets.only(top: 20, bottom: 8),
              child: Text(
                trimmed,
                style: theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                  color: theme.colorScheme.onSurface,
                ),
              ),
            ),
          );
        }
      }
      // List items
      else if (trimmed.startsWith('- ')) {
        widgets.add(
          Padding(
            padding: const EdgeInsets.only(left: 16, top: 8, bottom: 8),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '• ',
                  style: theme.textTheme.bodyLarge?.copyWith(
                    color: theme.colorScheme.primary,
                    fontSize: 20,
                  ),
                ),
                Expanded(
                  child: _parseInlineFormatting(
                    trimmed.substring(2),
                    theme,
                    isMobile,
                  ),
                ),
              ],
            ),
          ),
        );
      }
      // Horizontal rule
      else if (trimmed == '---') {
        widgets.add(
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 32),
            child: Divider(color: theme.colorScheme.outline, thickness: 1),
          ),
        );
      }
      // Regular paragraph
      else {
        widgets.add(
          Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: _parseInlineFormatting(trimmed, theme, isMobile),
          ),
        );
      }
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: widgets,
    );
  }

  Widget _parseInlineFormatting(String text, ThemeData theme, bool isMobile) {
    final spans = <TextSpan>[];
    final buffer = StringBuffer();
    int i = 0;

    while (i < text.length) {
      // Bold text **text**
      if (i < text.length - 1 && text[i] == '*' && text[i + 1] == '*') {
        if (buffer.isNotEmpty) {
          spans.add(
            TextSpan(
              text: buffer.toString(),
              style: theme.textTheme.bodyLarge?.copyWith(
                color: theme.colorScheme.onSurface.withValues(alpha: 0.8),
                height: 1.6,
                fontSize: isMobile ? 15 : 16,
              ),
            ),
          );
          buffer.clear();
        }
        i += 2;
        final endIndex = text.indexOf('**', i);
        if (endIndex != -1) {
          spans.add(
            TextSpan(
              text: text.substring(i, endIndex),
              style: theme.textTheme.bodyLarge?.copyWith(
                fontWeight: FontWeight.w600,
                color: theme.colorScheme.onSurface,
                height: 1.6,
                fontSize: isMobile ? 15 : 16,
              ),
            ),
          );
          i = endIndex + 2;
        } else {
          buffer.write('**');
        }
      }
      // Links [text](url)
      else if (text[i] == '[') {
        if (buffer.isNotEmpty) {
          spans.add(
            TextSpan(
              text: buffer.toString(),
              style: theme.textTheme.bodyLarge?.copyWith(
                color: theme.colorScheme.onSurface.withValues(alpha: 0.8),
                height: 1.6,
                fontSize: isMobile ? 15 : 16,
              ),
            ),
          );
          buffer.clear();
        }
        final linkEnd = text.indexOf(']', i);
        if (linkEnd != -1 &&
            linkEnd < text.length - 1 &&
            text[linkEnd + 1] == '(') {
          final urlStart = linkEnd + 2;
          final urlEnd = text.indexOf(')', urlStart);
          if (urlEnd != -1) {
            final linkText = text.substring(i + 1, linkEnd);
            // final url = text.substring(urlStart, urlEnd); // Could use with url_launcher
            spans.add(
              TextSpan(
                text: linkText,
                style: theme.textTheme.bodyLarge?.copyWith(
                  color: theme.colorScheme.secondary,
                  decoration: TextDecoration.underline,
                  height: 1.6,
                  fontSize: isMobile ? 15 : 16,
                ),
                recognizer: null, // Could add url_launcher here if needed
              ),
            );
            i = urlEnd + 1;
          } else {
            buffer.write(text[i]);
            i++;
          }
        } else {
          buffer.write(text[i]);
          i++;
        }
      }
      // Email [email]
      else if (text[i] == '[' && i < text.length - 1) {
        final emailEnd = text.indexOf(']', i);
        if (emailEnd != -1) {
          final email = text.substring(i + 1, emailEnd);
          if (buffer.isNotEmpty) {
            spans.add(
              TextSpan(
                text: buffer.toString(),
                style: theme.textTheme.bodyLarge?.copyWith(
                  color: theme.colorScheme.onSurface.withValues(alpha: 0.8),
                  height: 1.6,
                  fontSize: isMobile ? 15 : 16,
                ),
              ),
            );
            buffer.clear();
          }
          spans.add(
            TextSpan(
              text: email,
              style: theme.textTheme.bodyLarge?.copyWith(
                color: theme.colorScheme.secondary,
                decoration: TextDecoration.underline,
                height: 1.6,
                fontSize: isMobile ? 15 : 16,
              ),
            ),
          );
          i = emailEnd + 1;
        } else {
          buffer.write(text[i]);
          i++;
        }
      } else {
        buffer.write(text[i]);
        i++;
      }
    }

    if (buffer.isNotEmpty) {
      spans.add(
        TextSpan(
          text: buffer.toString(),
          style: theme.textTheme.bodyLarge?.copyWith(
            color: theme.colorScheme.onSurface.withValues(alpha: 0.8),
            height: 1.6,
            fontSize: isMobile ? 15 : 16,
          ),
        ),
      );
    }

    return RichText(text: TextSpan(children: spans));
  }
}
