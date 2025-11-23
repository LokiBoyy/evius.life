import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../utils/responsive.dart';

/// Philosophy and principles section
class PhilosophyAndPrinciplesSection extends StatelessWidget {
  const PhilosophyAndPrinciplesSection({super.key});

  static final principles = [
    (
      'My Device',
      'Native, respectful tools that work the way you expect without the Internet.',
      Icons.phone_iphone_outlined,
    ),
    (
      'My Data',
      'Your data stays on your device. No cloud, no accounts, no harvesting.',
      Icons.storage_outlined,
    ),
    (
      'My Privacy',
      'Privacy by default. No monitor, no tracking, no collection.',
      Icons.lock_outline,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isMobile = Responsive.isMobile(context);

    return Padding(
      padding: Responsive.padding(context),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildPhilosophySection(context, theme, isMobile),
          SizedBox(height: isMobile ? 64 : 80),
          _buildPrinciplesSection(context, theme, isMobile),
        ],
      ),
    );
  }

  Widget _buildPhilosophySection(
    BuildContext context,
    ThemeData theme,
    bool isMobile,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildQuoteBlock(context, theme, isMobile),
        SizedBox(height: isMobile ? 48 : 56),
        Text(
          'My goal is:',
          style: theme.textTheme.titleMedium?.copyWith(
            color: theme.colorScheme.onSurface,
            fontWeight: FontWeight.w600,
            fontSize: Responsive.value(
              context: context,
              mobile: 16.0,
              tablet: 18.0,
              desktop: 20.0,
            ),
          ),
        ).animate().fadeIn(duration: 500.ms, delay: 300.ms),
        SizedBox(height: isMobile ? 24 : 20),
        _buildGoalText(
          context,
          theme,
          'To create digital tools that seamlessly weave into and honor the quiet moments of our days.',
          400.ms,
        ),
        SizedBox(height: 12),
        _buildGoalText(
          context,
          theme,
          'To design not for distraction, but for presence, meaning, and mindful growth.',
          500.ms,
        ),
      ],
    );
  }

  Widget _buildQuoteBlock(
    BuildContext context,
    ThemeData theme,
    bool isMobile,
  ) {
    return Container(
      padding: EdgeInsets.only(
        left: isMobile ? 20 : 28,
        top: 4,
        bottom: 4,
      ),
      decoration: BoxDecoration(
        border: Border(
          left: BorderSide(
            color: theme.colorScheme.primary.withValues(alpha: 0.4),
            width: 4,
          ),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'There is a serene pleasure in cultivating one\'s own life \n — slowly, deliberately, and with intention.',
            style: theme.textTheme.headlineLarge?.copyWith(
              fontWeight: FontWeight.w700,
              fontSize: Responsive.value(
                context: context,
                mobile: 32.0,
                tablet: 42.0,
                desktop: 48.0,
              ),
              color: theme.colorScheme.onSurface,
              height: 1.25,
              letterSpacing: -0.3,
              fontStyle: FontStyle.italic,
            ),
          ).animate().fadeIn(duration: 500.ms, delay: 100.ms),
          SizedBox(height: 10),
          Text(
            'and that includes our digital lives.',
            style: theme.textTheme.bodyLarge?.copyWith(
              color: theme.colorScheme.tertiary,
              height: 1.5,
              fontSize: Responsive.value(
                context: context,
                mobile: 18.0,
                tablet: 20.0,
                desktop: 22.0,
              ),
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.w400,
            ),
          ).animate().fadeIn(duration: 500.ms, delay: 200.ms),
        ],
      ),
    );
  }

  Widget _buildGoalText(
    BuildContext context,
    ThemeData theme,
    String text,
    Duration delay,
  ) {
    return Text(
      text,
      style: theme.textTheme.bodyLarge?.copyWith(
        color: theme.colorScheme.onSurface.withValues(alpha: 0.85),
        height: 1.7,
        fontSize: Responsive.value(
          context: context,
          mobile: 16.0,
          tablet: 18.0,
          desktop: 20.0,
        ),
        fontStyle: FontStyle.italic,
      ),
    ).animate().fadeIn(duration: 500.ms, delay: delay);
  }

  Widget _buildPrinciplesSection(
    BuildContext context,
    ThemeData theme,
    bool isMobile,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ...principles.asMap().entries.map((entry) {
          final index = entry.key;
          final principle = entry.value;
          final useSecondary = index == 1;

          return Padding(
            padding: EdgeInsets.only(
              bottom: index < principles.length - 1 ? 32 : 0,
            ),
            child: _buildPrincipleItem(
              context,
              theme,
              principle,
              useSecondary,
              index,
            ),
          );
        }).toList(),
      ],
    );
  }

  Widget _buildPrincipleItem(
    BuildContext context,
    ThemeData theme,
    (String, String, IconData) principle,
    bool useSecondary,
    int index,
  ) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 48,
          height: 48,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: useSecondary
                ? theme.colorScheme.secondaryContainer
                : theme.colorScheme.primaryContainer,
          ),
          child: Icon(
            principle.$3,
            color: useSecondary
                ? theme.colorScheme.onSecondaryContainer
                : theme.colorScheme.onPrimaryContainer,
            size: 24,
          ),
        ),
        SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                principle.$1,
                style: theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                  fontSize: Responsive.value(
                    context: context,
                    mobile: 18.0,
                    tablet: 20.0,
                    desktop: 22.0,
                  ),
                  color: theme.colorScheme.onSurface,
                  height: 1.3,
                ),
              ),
              SizedBox(height: 8),
              Text(
                principle.$2,
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: theme.colorScheme.onSurface.withValues(alpha: 0.8),
                  height: 1.6,
                  fontSize: Responsive.value(
                    context: context,
                    mobile: 15.0,
                    tablet: 16.0,
                    desktop: 17.0,
                  ),
                  fontStyle: FontStyle.italic,
                ),
              ),
            ],
          ),
        ),
      ],
    ).animate().fadeIn(duration: 500.ms, delay: (600 + index * 100).ms).slideX(
          begin: 0.1,
          end: 0,
          duration: 500.ms,
          delay: (600 + index * 100).ms,
        );
  }
}
