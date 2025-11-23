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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flex(
            direction: isMobile ? Axis.vertical : Axis.horizontal,
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(
                flex: isMobile ? 0 : 1,
                child: _buildBoxContainer(context, theme, isMobile),
              ),
              SizedBox(
                width: isMobile ? 0 : 60,
                height: isMobile ? AppConstants.spacingXL : 0,
              ),
              Flexible(
                flex: isMobile ? 0 : 1,
                child: RichText(
                  textAlign: TextAlign.left,
                  text: TextSpan(
                    style: theme.textTheme.displayLarge?.copyWith(
                      fontSize: Responsive.value(
                        context: context,
                        mobile: 36.0,
                        tablet: 56.0,
                        desktop: 80.0,
                      ),
                      fontWeight: FontWeight.bold,
                      height: 1.2,
                      letterSpacing: 1,
                      color: theme.colorScheme.onSurface,
                    ),
                    children: [
                      TextSpan(
                        text: 'Make it.',
                        style: TextStyle(
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.w300,
                          fontSize: Responsive.value(
                            context: context,
                            mobile: 36.0 * 0.7,
                            tablet: 56.0 * 0.7,
                            desktop: 80.0 * 0.7,
                          ),
                          color: theme.colorScheme.onSurface
                              .withValues(alpha: 0.6),
                        ),
                      ),
                      const TextSpan(text: '\n'),
                      TextSpan(
                        text: 'Mindful.',
                      ),
                      const TextSpan(text: '\n'),
                      TextSpan(
                        text: 'Intentional.',
                        style: TextStyle(color: theme.colorScheme.primary),
                      ),
                      const TextSpan(text: '\n'),
                      TextSpan(
                        text: 'Beautiful.',
                        style: TextStyle(color: theme.colorScheme.secondary),
                      ),
                    ],
                  ),
                ).animate().fadeIn(duration: 600.ms, delay: 100.ms),
              ),
            ],
          ),
          SizedBox(height: isMobile ? 60 : 100),
          _buildVisualElement(context, theme, isMobile),
        ],
      ),
    );
  }

  Widget _buildBoxContainer(
    BuildContext context,
    ThemeData theme,
    bool isMobile,
  ) {
    return Container(
      width: isMobile ? double.infinity : null,
      height: isMobile ? 200 : 400,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppConstants.radiusLG),
        color: theme.colorScheme.surfaceContainer,
        border: Border.all(
          color: theme.colorScheme.outline.withValues(alpha: 0.2),
          width: 1,
        ),
      ),
      child: Center(
        child: Icon(
          Icons.phone_iphone,
          size: isMobile ? 60 : 100,
          color: theme.colorScheme.primary.withValues(alpha: 0.6),
        ),
      ),
    ).animate().fadeIn(duration: 600.ms, delay: 200.ms);
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
      child: SizedBox(
        width: double.infinity,
        height: isMobile ? 400 : 600,
        child: Container(
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
