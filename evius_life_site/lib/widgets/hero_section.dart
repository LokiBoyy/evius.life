import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../utils/responsive.dart';
import '../config/constants.dart';

/// Hero section widget
class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isMobile = Responsive.isMobile(context);

    return Padding(
      padding: Responsive.padding(context),
      child: Column(
        children: [
          Text(
                'I think we are missing\nthe beauty in our digital lives.',
                textAlign: TextAlign.center,
                style: theme.textTheme.displayLarge?.copyWith(
                  fontSize: Responsive.value(
                    context: context,
                    mobile: 36.0,
                    tablet: 56.0,
                    desktop: 80.0,
                  ),
                  fontWeight: FontWeight.w300,
                  height: 1.1,
                  letterSpacing: -1,
                  color: theme.colorScheme.onSurface,
                ),
              )
              .animate()
              .fadeIn(duration: 600.ms, delay: 100.ms)
              .slideY(begin: -0.2, end: 0, duration: 600.ms, delay: 100.ms),
          SizedBox(height: isMobile ? 60 : 100),
          _buildVisualElement(context, theme, isMobile),
        ],
      ),
    );
  }

  Widget _buildVisualElement(
    BuildContext context,
    ThemeData theme,
    bool isMobile,
  ) {
    return Card(
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppConstants.radiusXL),
          ),
          color: theme.colorScheme.primaryContainer,
          child: Container(
            constraints: BoxConstraints(
              maxWidth: isMobile ? double.infinity : 900,
              maxHeight: isMobile ? 400 : 600,
            ),
            padding: const EdgeInsets.all(1),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(34),
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  theme.colorScheme.primary,
                  theme.colorScheme.secondary,
                ],
              ),
            ),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(34),
                color: theme.colorScheme.surface,
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.phone_iphone,
                      size: isMobile ? 80 : 120,
                      color: theme.colorScheme.primary,
                    ),
                    const SizedBox(height: AppConstants.spacingMD),
                    Text(
                      'Visual Preview',
                      style: theme.textTheme.titleLarge?.copyWith(
                        color: theme.colorScheme.onSurface.withValues(
                          alpha: 0.6,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        )
        .animate()
        .scale(
          begin: const Offset(0.9, 0.9),
          end: const Offset(1, 1),
          duration: 800.ms,
          delay: 300.ms,
          curve: Curves.easeOutCubic,
        )
        .fadeIn(duration: 800.ms, delay: 300.ms);
  }
}
