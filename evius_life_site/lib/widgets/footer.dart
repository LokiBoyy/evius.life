import 'package:flutter/material.dart';
import '../utils/responsive.dart';
import '../config/constants.dart';
import '../config/routes.dart';

/// Footer widget
class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isMobile = Responsive.isMobile(context);

    return Padding(
      padding: Responsive.padding(context),
      child: Column(
        children: [
          Divider(color: theme.colorScheme.outline, thickness: 1),
          SizedBox(
            height: isMobile
                ? AppConstants.spacingXXL
                : AppConstants.spacingXXXL,
          ),
          _buildAuthorCredit(context, theme),
          SizedBox(
            height: isMobile ? AppConstants.spacingLG : AppConstants.spacingXL,
          ),
          _buildFooterLinks(context, theme, isMobile),
          SizedBox(
            height: isMobile
                ? AppConstants.spacingXXL
                : AppConstants.spacingXXXL,
          ),
        ],
      ),
    );
  }

  Widget _buildAuthorCredit(BuildContext context, ThemeData theme) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.favorite,
          size: AppConstants.spacingMD,
          color: theme.colorScheme.secondary.withValues(alpha: 0.8),
        ),
        const SizedBox(width: AppConstants.spacingXS),
        Text(
          'Made with care by ',
          style: theme.textTheme.bodyLarge?.copyWith(
            color: theme.colorScheme.onSurface.withValues(alpha: 0.6),
            letterSpacing: 0.5,
          ),
        ),
        Text(
          AppConstants.authorName,
          style: theme.textTheme.bodyLarge?.copyWith(
            color: theme.colorScheme.primary,
            fontWeight: FontWeight.normal,
            letterSpacing: 0.5,
          ),
        ),
      ],
    );
  }

  Widget _buildFooterLinks(
    BuildContext context,
    ThemeData theme,
    bool isMobile,
  ) {
    return Wrap(
      spacing: isMobile ? AppConstants.spacingLG : AppConstants.spacingLG,
      runSpacing: isMobile ? AppConstants.spacingSM : AppConstants.spacingLG,
      alignment: WrapAlignment.center,
      children: [
        FooterLink(
          'Contact',
          Icons.mail_outline,
          onTap: () => Navigator.of(context).pushNamed(AppRoutes.contact),
        ),
        FooterLink(
          'Privacy',
          Icons.lock_outline,
          onTap: () => Navigator.of(context).pushNamed(AppRoutes.privacyPolicy),
        ),
        FooterLink(
          'Terms',
          Icons.description_outlined,
          onTap: () =>
              Navigator.of(context).pushNamed(AppRoutes.termsConditions),
        ),
      ],
    );
  }
}

/// Footer link widget
class FooterLink extends StatefulWidget {
  const FooterLink(this.label, this.icon, {super.key, this.onTap});

  final String label;
  final IconData icon;
  final VoidCallback? onTap;

  @override
  State<FooterLink> createState() => _FooterLinkState();
}

class _FooterLinkState extends State<FooterLink> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isPrivacy = widget.label == 'Privacy';

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(
            milliseconds: AppConstants.animationDurationFast,
          ),
          padding: const EdgeInsets.symmetric(
            horizontal: AppConstants.spacingSM,
            vertical: 10,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppConstants.radiusSM),
            color: _isHovered
                ? theme.colorScheme.surfaceContainerHighest
                : Colors.transparent,
            border: Border.all(
              color: _isHovered
                  ? (isPrivacy
                        ? theme.colorScheme.secondary.withValues(alpha: 0.3)
                        : theme.colorScheme.primary.withValues(alpha: 0.3))
                  : Colors.transparent,
              width: 1,
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                widget.icon,
                size: AppConstants.spacingSM,
                color: _isHovered
                    ? (isPrivacy
                          ? theme.colorScheme.secondary
                          : theme.colorScheme.primary)
                    : theme.colorScheme.onSurface.withValues(alpha: 0.6),
              ),
              const SizedBox(width: AppConstants.spacingXS),
              Text(
                widget.label,
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: _isHovered
                      ? (isPrivacy
                            ? theme.colorScheme.secondary
                            : theme.colorScheme.primary)
                      : theme.colorScheme.onSurface.withValues(alpha: 0.7),
                  fontWeight: _isHovered ? FontWeight.w500 : FontWeight.w400,
                  letterSpacing: 0.3,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
