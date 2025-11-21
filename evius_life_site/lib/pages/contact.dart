import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../utils/url_launcher.dart';
import '../utils/responsive.dart';
import '../config/constants.dart';
import '../utils/seo_service.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({super.key});

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  @override
  void initState() {
    super.initState();
    SeoService.setContactPageMeta();
  }

  @override
  Widget build(BuildContext context) {
    Future<void> _launchEmail() async {
      await UrlLauncher.launchEmail(AppConstants.contactEmail);
    }

    final theme = Theme.of(context);
    final isMobile = Responsive.isMobile(context);

    return Scaffold(
      body: SizedBox.expand(
        child: Container(
          decoration: BoxDecoration(
            color: theme.colorScheme.surfaceContainerLowest,
          ),
          child: SafeArea(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(
                horizontal: isMobile ? 24 : 48,
                vertical: 24,
              ),
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  maxWidth: isMobile ? double.infinity : 800,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Back button
                    Row(
                      children: [
                        IconButton(
                          icon: const Icon(Icons.arrow_back),
                          onPressed: () => Navigator.of(context).pop(),
                          color: theme.colorScheme.onSurface,
                        ),
                      ],
                    ),
                    SizedBox(height: isMobile ? 24 : 40),
                    // Header section
                    Text(
                      'Hi, I\'m Lokesh 👋',
                      style: theme.textTheme.headlineLarge?.copyWith(
                        fontWeight: FontWeight.w700,
                        color: theme.colorScheme.onSurface,
                        fontSize: isMobile ? 32 : 48,
                      ),
                    ).animate().fadeIn(duration: 600.ms, delay: 100.ms).slideY(
                          begin: -0.2,
                          end: 0,
                          duration: 600.ms,
                          delay: 100.ms,
                        ),
                    SizedBox(height: isMobile ? 24 : 32),
                    // Bio section
                    Text(
                      'I\'m an independent app developer building tools that respect your attention. '
                      'I believe digital tools have become soulless, so I create apps that are '
                      'intentional, beautiful, and privacy-focused.',
                      style: theme.textTheme.bodyLarge?.copyWith(
                        color: theme.colorScheme.onSurface.withValues(
                          alpha: 0.8,
                        ),
                        height: 1.8,
                        fontSize: isMobile ? 16 : 18,
                      ),
                    ).animate().fadeIn(duration: 600.ms, delay: 200.ms).slideY(
                          begin: -0.1,
                          end: 0,
                          duration: 600.ms,
                          delay: 200.ms,
                        ),
                    SizedBox(height: isMobile ? 32 : 48),
                    Text(
                      'If you have questions or feedback, please don\'t hesitate to contact me.',
                      style: theme.textTheme.bodyLarge?.copyWith(
                        color: theme.colorScheme.onSurface.withValues(
                          alpha: 0.7,
                        ),
                        height: 1.8,
                        fontSize: isMobile ? 16 : 18,
                      ),
                    ).animate().fadeIn(duration: 600.ms, delay: 300.ms).slideY(
                          begin: -0.1,
                          end: 0,
                          duration: 600.ms,
                          delay: 300.ms,
                        ),
                    SizedBox(height: isMobile ? 48 : 64),
                    // Contact methods
                    Wrap(
                      spacing: isMobile ? 16 : 24,
                      runSpacing: isMobile ? 16 : 24,
                      children: [
                        _ContactButton(
                          label: 'Email',
                          icon: Icons.mail_outline,
                          onTap: _launchEmail,
                          color: theme.colorScheme.primary,
                        ),
                      ],
                    ).animate().fadeIn(duration: 600.ms, delay: 400.ms).slideY(
                          begin: 0.1,
                          end: 0,
                          duration: 600.ms,
                          delay: 400.ms,
                        ),
                    SizedBox(height: isMobile ? 64 : 80),
                    // Contact information section
                    Divider(color: theme.colorScheme.outline, thickness: 1),
                    SizedBox(height: isMobile ? 32 : 40),
                    Text(
                      'Obligatory contact information',
                      style: theme.textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.w600,
                        color: theme.colorScheme.onSurface,
                        fontSize: isMobile ? 20 : 24,
                      ),
                    ),
                    SizedBox(height: isMobile ? 24 : 32),
                    _ContactInfoItem(
                      label: 'Name',
                      value: AppConstants.authorName,
                      theme: theme,
                    ),
                    SizedBox(height: isMobile ? 16 : 20),
                    _ContactInfoItem(
                      label: 'Email',
                      value: AppConstants.contactEmail,
                      theme: theme,
                      onTap: _launchEmail,
                    ),
                    SizedBox(height: isMobile ? 16 : 20),
                    _ContactInfoItem(
                      label: 'Address',
                      value: '[Add address placeholder here]',
                      theme: theme,
                    ),
                    SizedBox(height: isMobile ? 16 : 20),
                    _ContactInfoItem(
                      label: 'Phone',
                      value: '[Add phone placeholder here]',
                      theme: theme,
                    ),
                    SizedBox(height: isMobile ? 48 : 64),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _ContactButton extends StatefulWidget {
  const _ContactButton({
    required this.label,
    required this.icon,
    required this.onTap,
    required this.color,
  });

  final String label;
  final IconData icon;
  final VoidCallback onTap;
  final Color color;

  @override
  State<_ContactButton> createState() => _ContactButtonState();
}

class _ContactButtonState extends State<_ContactButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18),
            color: _isHovered
                ? widget.color.withValues(alpha: 0.2)
                : theme.colorScheme.surfaceContainer,
            border: Border.all(
              color: _isHovered
                  ? widget.color.withValues(alpha: 0.5)
                  : theme.colorScheme.outline,
              width: 1,
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                widget.icon,
                color: _isHovered ? widget.color : theme.colorScheme.onSurface,
                size: 20,
              ),
              const SizedBox(width: 12),
              Text(
                widget.label,
                style: theme.textTheme.bodyLarge?.copyWith(
                  color:
                      _isHovered ? widget.color : theme.colorScheme.onSurface,
                  fontWeight: _isHovered ? FontWeight.w600 : FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ContactInfoItem extends StatelessWidget {
  const _ContactInfoItem({
    required this.label,
    required this.value,
    required this.theme,
    this.onTap,
  });

  final String label;
  final String value;
  final ThemeData theme;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: theme.textTheme.bodySmall?.copyWith(
            color: theme.colorScheme.onSurface.withValues(alpha: 0.6),
            fontSize: 12,
            fontWeight: FontWeight.w500,
            letterSpacing: 0.5,
          ),
        ),
        const SizedBox(height: 4),
        GestureDetector(
          onTap: onTap,
          child: Text(
            value,
            style: theme.textTheme.bodyLarge?.copyWith(
              color: onTap != null
                  ? theme.colorScheme.secondary
                  : theme.colorScheme.onSurface.withValues(alpha: 0.8),
              fontSize: isMobile ? 15 : 16,
              decoration: onTap != null ? TextDecoration.underline : null,
            ),
          ),
        ),
      ],
    );
  }
}
